class ApplicationController < ActionController::Base
  include ApplicationHelper
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  add_flash_types :danger, :info, :success, :warning

  # Store the url trying to be accessed
  def store_location
    session[:desired_url] = request.url if request.get?
  end

  # Store the referrer url
  def store_referrer
    session[:return_to] = request.referrer if request.get?
  end

  # redirect to desired location or default
  def redirect_back_or(default, options = {})
    redirect_to(session.delete(:desired_url) || default, options)
  end

  # redirect to referrer or default
  def return_to_referrer_or(default, options = {})
    redirect_to(session[:return_to] || default, options)
  end

  private

  def confirm_logged_in
    if session[:user_id].present?
      return true
    else
      store_location # store the location of the request
      flash[:danger] = 'Please Log in'
      redirect_to(controller: 'access', action: 'login')
      return false
    end
  end

  def friendly_flash
    flash[:warning] = 'Cannot delete record because dependent record exists'
    redirect_to :back
  end

  def user_not_authorized
    flash[:danger] = "You are not authorized to perform this action."
    redirect_to(request.referrer || root_path)
  end

  def authorize_admin!
    unless current_user.admin?
      user_not_authorized
    end
  end
end
