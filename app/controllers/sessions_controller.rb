class SessionsController < ApplicationController
	def new	
	end

	def create
		user = User.find_by(username: params[:session][:username].downcase)

		if user && user.authenticate(params[:session][:password]) && user.activated?
			sign_in user
			redirect_to root_url
		elsif user && user.authenticate(params[:session][:password]) && !user.activated?
			flash.now[:notice] = "Please ask the administrator to activate your account."
			render 'new'
		else
			flash.now[:error] = "Invalid user/password combination"
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_url
	end

end
