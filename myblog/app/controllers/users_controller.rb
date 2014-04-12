class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to users_path
  end

  def index
    @users = User.find(:all)
  end

  def edit
  end




  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password, :role)
    end

end
