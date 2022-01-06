class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: session_params[:email])
    if user&.password == session_params[:password]
      session[:user_id] = user.id
      flash[:notice] = 'Successfully signed in'
      redirect_to students_path
    else
      flash[:alert] = 'Incorrect email or password'
      render :new
    end
  end
  
  def destroy
    session.delete(:user_id)
    redirect_to students_path
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
