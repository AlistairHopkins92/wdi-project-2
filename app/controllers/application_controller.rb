class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?

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

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u| 
        u.permit(:email, :username, :first_name, :last_name, :password, :password_confirmation, :image)
      end
      devise_parameter_sanitizer.for(:account_update) do |u| 
        u.permit(:email, :username, :first_name, :last_name, :password, :password_confirmation, :image)
      end
    end

end
