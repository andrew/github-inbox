# frozen_string_literal: true
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?
  before_action :authenticate_user!

  private

  def authenticate_user!
    unless logged_in?
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :unauthorized }
      end
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
