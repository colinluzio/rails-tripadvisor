class UsersController < ApplicationController
	before_action :authorize
	def new
		@user = User.new
	end
	
	def authorize
		unless User.find_by(id: session[:user_id])
		redirect_to login_url, notice: "You trying to login?" and return
		end
		
		@user = User.find(params[:id])
		sessionId = session[:user_id]
		if @user.id != sessionId
			redirect_to '/users/' +sessionId.to_s
		end
	end
	
	def create
		@user = User.new(params[:user])
		if @user.save
			redirect_to @user, notice: 'User was successfully created.'
		else
		# render :text => "here"
		render action: "new"
		end
	end
	
	def show
		@user = User.find(params[:id])
		@number = session[:user_id]
	end
end
