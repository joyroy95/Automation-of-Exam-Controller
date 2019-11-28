class SessionsController < ApplicationController
  def new
  end
  def create
    @user = User.find_by(email: params[:session][:email].downcase)
    puts @user
      if @user && @user.authenticate(params[:session][:password])
        log_in @user
        redirect_to @user
      else
        flash.now[:danger] = "Invalid email/password combination"
        render 'new'
      end
  end
  def destroy
    #log_out
    session[:user_id] = nil
    @current_user = nil
    redirect_to students_login_url
  end
  def log_in(user)
    session[:user_id] = user.id
  end
end
