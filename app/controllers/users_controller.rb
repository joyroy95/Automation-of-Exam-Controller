class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
    @user = User.find(params[:id])
  end
  def show
    @user = User.find(session[:user_id])
    @personal_info = PersonalInfo.find_by(users_id: session[:user_id])
    @registrations = Registration.where(users_id: @user.id)
    if !@personal_info.nil?
      @hall = Hall.find(@personal_info.halls_id)
    end
    
  end
  def create
    @user = User.new(user_params)
    @pass = params[:id]
    if @user.save
      redirect_to new_personal_info_path(@user, :param_1=> @pass)
    else
      render 'new'
    end
  end
  private
      def user_params
        params.require(:user).permit(:id, :name, :email, :departments_id, :password, :password_confirmation)
      end
end
