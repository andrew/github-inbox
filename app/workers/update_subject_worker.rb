# frozen_string_literal: true

class UpdateSubjectWorker
  include Sidekiq::Worker
  sidekiq_options queue: :sync_subjects, unique: :until_and_while_executing

  def perform(notification_id, force = false)
    Notification.find(notification_id).try(:update_subject_in_foreground, force)
  end
end
