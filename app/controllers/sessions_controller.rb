class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email].downcase)

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to roles_path, notice: "Welcome back to Summoner's Rift, #{@user.name}"
    else
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end
  #
  # def destroy
  #   session.delete(:user_id)
  #   redirect_to login_path, notice: "Logged out!"
  # end
end
