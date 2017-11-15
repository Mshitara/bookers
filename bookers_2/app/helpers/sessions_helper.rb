module SessionsHelper
	def log_in(user)
		session[:user_id] = user.id
	end
	def current_user
   		@current_user ||= User.find_by(id: session[:user_id])
   		# if @current_user = nil,
   		#  @current_user = User.find_by(id: session[:user_id])
   		# else
   		#  @current_user
  	end
  	def logged_in?
  		!current_user.nil?
  	end
  	def log_out
  		session[:user_id] = nil
  		@current_user = nil
  	end
end
