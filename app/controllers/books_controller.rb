class BooksController < ApplicationController
	before_action :correct_user, only: [:edit, :update]
	def create
		@new_book = Book.new(book_params)
		@new_book.user_id = current_user.id
		@user = current_user
		if @new_book.save
			flash[:notice] = "you've created book successfully."
		   redirect_to books_path
		else
			@books = Book.all
			render action: :index
		end
	end
	def index
		@books = Book.all
		@new_book = Book.new
		@user = current_user
	end
	def show
		@book = Book.find(params[:id])
		@new_book = Book.new
		@user = @book.user
	end
	def destroy
		@book = Book.find(params[:id])
		@book.destroy
	end
	def edit
		@book = Book.find(params[:id])
	end
	def update
		@book = Book.find(params[:id])
		@user = current_user
		@new_book = Book.new(book_params)
		if @book.update(book_params)
			flash[:notice] = "successfully updated"
			redirect_to book_path(@book)
		else
			flash[:notice] = "error occurred"
			render "edit"
		end
	end

private
	def book_params
		params.require(:book).permit(:body, :title)
	end
	def correct_user
		book = Book.find(params[:id])
		if current_user.id != book.user.id
			redirect_to books_path
		end
	end

end
