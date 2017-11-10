class BookersController < ApplicationController
	def bookers_top

	end
	def new
	end
	def index
		@books = Book.all
		@book = Book.new
	end
	def create
		book = Book.new(bookers_params)
		book.save
		redirect_to '/index'
	end
	def show
		@book = Book.find(params[:id])
	end
	def edit
		@book = Book.find(params[:id])
	end
	def destroy
		@book = Book.find(params[:id])
	end

	private
	def bookers_params
		params.require(:book).permit(:title, :memo)
	end
end
