class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	include SessionsHelper

	def signed_in_user
		redirect_to signin_url, notice: 'Please sign in.' unless signed_in?
	end

	def user_activated
		redirect_to signin_url, notice: 'Please contact the administrator to activate your account.' unless acc_activated?
	end

	#def admin
	#	redirect_to root_url, flash.now[:notice] = "Only the administrator can reach that page." unless admin?
	#end
end
