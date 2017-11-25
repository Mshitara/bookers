class BooksController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update]

	def new
	end

	def create
		@book = Book.new(book_params)
		@book.user_id = session[:user_id]
		@book.save
		redirect_to user_path(session[:user_id])
	end

	def show
		@book = Book.find(params[:id])
		@book_show_form = Book.new
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

	def index
		@book_index = Book.all
		@book = Book.new
		@user = User.find(session[:user_id])

	end

	private
	def book_params
		params.require(:book).permit(:title, :opinion, :user_id, :user_profile_image)
	end

	def logged_in_user
      unless logged_in?
      	redirect_to login_path
  	  end
    end

    def correct_user
      @user = User.find(session[:user_id])
      redirect_to (login_path) unless current_user?(@user)
    end
end
