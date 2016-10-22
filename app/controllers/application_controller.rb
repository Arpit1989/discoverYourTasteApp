class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def signed_in?
    if current_user.nil?
      flash[:notice] = "Oops! looks like you are not logged in yet! please sign in"
      redirect_to root_path
    else
      true
    end
  end


  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user
end
