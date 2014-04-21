class UsersController < ApplicationController
  before_action :authenticate_user!
  layout "admin_layout"

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to users_path
    else
      render 'new'
    end
  end

  def index
    @users = User.all
    @articles = Article.order("created_at desc")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = user_params
    if @user.save
      redirect_to users_path
    else
      render 'edit'
    end
  end


  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end



  private
    def user_params
      params.require(:user).permit(:name, :email, :avatar, :password, :role)
    end

end
