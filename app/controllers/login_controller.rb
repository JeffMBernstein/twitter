class LoginController < ApplicationController
  def login
    @user = User.new
  end

  def create_session
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "You are logged in as #{@user.email}"
    else
      flash.now.alert = "Email or password is invalid."
      render :login
    end
  end

  def logout
    session[:user_id] = nil #or reset_session to remove all
    redirect_to tweets_path
  end
end
