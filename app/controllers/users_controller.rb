class UsersController < ApplicationController
  before_action :correct_user, only: [:edit, :update]

  def new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      redirect_to user_path(@user.id)
    else
      render:edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @users = User.find(params[:id])
    @user = @users
    redirect_to user_path(current_user.id) unless @user == current_user
  end

end