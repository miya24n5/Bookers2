class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def update
    @user = User.find(params[:id])
    @user.update
    redirect_to 

  def index
  end

  def edit
    @user = User.find(params[:id])
  end


end
