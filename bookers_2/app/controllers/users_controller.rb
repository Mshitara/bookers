class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update]
  before_action :correct_user, only:[:edit, :update]

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  	@books = Book.where(user_id: User.find(params[:id]))
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		log_in @user
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  def edit
  	#@user = User.find(session[:user_id])
  end

  def update
  	#@user = User.find(session[:user_id])
  	@user.update(user_params)
	  redirect_to user_path(@user.id), notice: "Successfully Updated"
  end

  def index
  	@user_index = User.all
    @user = User.find(session[:user_id])
    @book = Book.new
  end

  private

    def user_params
    	params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :profile_image )
    end

    def book_params
  	params.require(:book).permit(:title, :opinion, :user_id, :user_profile_image)
    end

    def logged_in_user
      unless logged_in?
      redirect_to login_path
    end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to (login_path) unless current_user?(@user)
    end
end
