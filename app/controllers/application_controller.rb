class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :check_account

  def check_account
    if current_user.account_expired?
      SaletMailer.expired_account(current_user).deliver
      sign_out
    end
    # Further development
    return
  end

end
