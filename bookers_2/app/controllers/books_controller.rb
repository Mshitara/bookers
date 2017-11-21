class BooksController < ApplicationController
	def new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = session[:user_id]
		@book.save
		redirect_to user_path
	end

	def show
		@book = Book.find(params[:id])
		#@book.user_id = session[:user_id]
		#@books = Book.where(user_id: session[:user_id])
		@user = User.find(session[:user_id])
	end

	def edit
		@book = Book.find(params[:id])
	end

	def update
		@book = Book.find(params[:id])
		@book.update(book_params)
		redirect_to book_path(@book.id), notice: "You did it!"
	end

	def destroy
		@book = Book.find(params[:id])
		@book.destroy
		redirect_to user_path(session[:user_id]), notice: "You did it!"
	end

	private
	def book_params
		params.require(:book).permit(:title, :opinion, :user_id, :user_profile_image)
	end
end
