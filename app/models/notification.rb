# frozen_string_literal: true
class Notification < ApplicationRecord
  include PgSearch
  pg_search_scope :search_by_subject_title,
                  against: :subject_title,
                  using: {
                    tsearch: {
                      prefix: true,
                      negation: true,
                      dictionary: "english"
                    }
                  }

  belongs_to :user

  scope :inbox,    -> { where(archived: false) }
  scope :archived, -> { where(archived: true) }
  scope :newest,   -> { order('updated_at DESC') }
  scope :starred,  -> { where(starred: true) }

  scope :repo,     ->(repo_name)    { where(repository_full_name: repo_name) }
  scope :type,     ->(subject_type) { where(subject_type: subject_type) }
  scope :reason,   ->(reason)       { where(reason: reason) }
  scope :status,   ->(status)       { where(unread: status) }
  scope :owner,    ->(owner_name)   { where(repository_owner_name: owner_name) }

  paginates_per 20

  class << self
    def download(user, options = {})
      timestamp = Time.current

      fetch_notifications(user, options) do |notification|
        begin
          n = user.notifications.find_or_initialize_by(github_id: notification.id)

          if n.archived && n.updated_at < notification.updated_at
            n.archived = false
          end

          attrs = {}.tap do |attr|
            attr[:repository_id]         = notification.repository.id
            attr[:repository_full_name]  = notification.repository.full_name
            attr[:repository_owner_name] = notification.repository.owner.login
            attr[:subject_title]         = notification.subject.title
            attr[:subject_type]          = notification.subject.type
            attr[:reason]                = notification.reason
            attr[:unread]                = notification.unread
            attr[:updated_at]            = notification.updated_at
            attr[:last_read_at]          = notification.last_read_at
            attr[:url]                   = notification.url

            attr[:subject_url] = if notification.subject.type == "RepositoryInvitation"
                                   "#{notification.repository.html_url}/invitations"
                                 else
                                   notification.subject.url
                                 end
          end

          n.attributes = attrs
          n.save(touch: false) if n.changed?
        rescue ActiveRecord::RecordNotUnique
          nil
        end
      end

      user.update_column(:last_synced_at, timestamp)
    end

    private

    def fetch_notifications(user, options = {})
      params = fetch_params(user, options)
      user.github_client.notifications(params).each { |n| yield n }
    end

    def fetch_params(user, quick_sync: false)
      case
        when !user.last_synced_at
          {all: true, since: 1.month.ago.iso8601}
        when quick_sync
          {all: true, since: user.last_synced_at.iso8601}
        else
          {all: true, since: 1.week.ago.iso8601}
      end
    end
  end

  def mark_as_read
    user.github_client.mark_thread_as_read(github_id, read: true)
  end

  def ignore_thread
    user.github_client.update_thread_subscription(github_id, ignored: true)
  end

  def mute
    mark_as_read
    ignore_thread
  end

  def web_url
    subject_url.gsub("#{Octobox.github_api_prefix}/repos", Octobox.github_domain)
               .gsub('/pulls/', '/pull/')
               .gsub('/commits/', '/commit/')
  end

  def repo_url
    "#{Octobox.github_domain}/#{repository_full_name}"
  end
end
