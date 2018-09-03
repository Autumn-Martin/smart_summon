class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)

    # make all emails downcase to avoid case-sensitive duplicates & login-errors
    @user.email.downcase!

    if @user.save
      flash[:notice] = "Welcome to Summoner's Rift #{@user.name}"
      redirect_to root_path
    else
      flash.now.alert = "Please try again."
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
