class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?
  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section of the site."
      redirect_to login_path
    end
  end

end
