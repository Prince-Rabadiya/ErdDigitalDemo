class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Successfully signed up'
      session[:user_id] = @user.id
      redirect_to students_path
    else
      flash[:alert] = 'Error while signing up'
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
