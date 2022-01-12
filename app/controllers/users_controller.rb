class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end


  private

  def user_params
  params.require(:user).permit(:name, :image, :introduction)
  end



end
