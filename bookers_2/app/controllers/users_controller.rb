class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def show
  	@user = User.find(session[:user_id])
  	@book = Book.new
  	@books = Book.where(user_id: session[:user_id])
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
  	@user = User.find(session[:user_id])
  end

  def update
  	@user = User.find(session[:user_id])
  	@user.update(user_params)
	redirect_to user_path(@user.id), notice: "Successfully Updated"
  end

  private

  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduction, :profile_image )
  end

  def book_params
	params.require(:book).permit(:title, :opinion, :user_id, :user_profile_image)
  end
end
