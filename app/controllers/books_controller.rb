class BooksController < ApplicationController

	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		if @new_book.save
		   redirect_to '/books'
		else
			@books = Book.all
			render 'index'
		end
	end
	def index
		@books = Book.all
		@new_book = Book.new
		@user = current_user
	end
	def show
		@book = Book.find(params[:id])
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
	end
	def edit
	end
	def update
	end

private
	def book_params
		params.require(:book).permit(:body, :title)
	end
	def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
