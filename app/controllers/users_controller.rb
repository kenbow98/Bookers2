class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def create
    @user=User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome! You have signed up successfully."
    end
  end

  def edit
    @user = User.find(params[:id])
    if @user === current_user
      render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success]="You have updated user successfully."
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:profile_image,:introduction)
  end
end