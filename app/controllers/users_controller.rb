class UsersController < ApplicationController
  def top
  end
  def about
  end
  def show
  	@user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end
  def index
    @users = User.all
    @new_book = Book.new
    @books = Book.all
    @user = current_user
  end
  private
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
