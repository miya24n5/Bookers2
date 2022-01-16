class UsersController < ApplicationController
  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books
    @users = User.all
    # @profile_image = @user.profile_image
  end

  def index
    # @user = User.find(params[:id])
    # @profile_image = @user.profile_image
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
      redirect_to users_path(@user.id)
    else
      render :edit
    end
  end


  private

  def user_params
  params.require(:user).permit(:name, :introduction, :image)
  end



end
