class SessionsController < ApplicationController
	include SessionsHelper
	skip_before_action :authorize
	def new
	end
	
	def create
		user = User.authenticate(params[:session][:email], params[:session][:password])
		
		if user.nil?
			flash.now[:error] = "invalid email/password combination."
			render :new
		else
			sign_in user
			redirect_to user
			#redirect_to user
		end
	end
	
	def destroy
		sign_out
		redirect_to login_url
	end
	
	def sign_out
		reset_session
	end
end
