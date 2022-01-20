class UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :correct_user, only: [:edit]

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
  end

  def index
    @user = current_user
    # @user = User.find(params[:id])
    @book = Book.new
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # @user.user_id = current_user.id
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice: 'You have updated user successfully.'
    else
      render :edit
    end
  end


  private

  def user_params
  params.require(:user).permit(:name, :introduction, :profile_image)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(current_user) unless @user == current_user
  end



end
