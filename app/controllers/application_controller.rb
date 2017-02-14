class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  rescue_from Pundit::NotAuthorizedError, with: :permission_denied

  private
  def permission_denied
    redirect_to after_sign_in_path_for(current_user), alert: "We're sorry but you are not allowed to access this page or feature."
    return
  end
end
