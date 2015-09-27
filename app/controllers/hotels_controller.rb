class HotelsController < ApplicationController
 before_action :authorize, only: [:new]
 def new
	 @countries = Country.all
	 @hotel = Hotel.new
	 @photo = Photo.new
 end
 def authorize
		unless User.find_by(id: session[:user_id])
		redirect_to login_url, notice: "You trying to login?" and return
		end
		sessionId = session[:user_id]
		@hotel = Hotel.where(:user_id =>sessionId ).limit(1)
		if  @hotel.present?
			redirect_to '/users/' +sessionId.to_s
		end
	end
 def show
  @hotel = Hotel.find(params[:id])
  @comments = @hotel.comments
  @comment_id = Comment.find(1)
  @author = @comment_id.author_id
  @author = Author.find(@author)
 end
 
 def create
	@hotel = Hotel.new(hotel_params)
	@hotel.save 
	@hotelPhotos = session[:hotel_photos]
	
	@hotelPhotos.each do | i |
		photo = Photo.find_by(id: i)
		photo.update(hotel_id: @hotel.id)
	end
	respond_to do |format|
			 format.json { render json: @hotel}
  			 format.js   { render action: 'create', status: :created, location: @hotel }
		end	 
	end
	
	def edit
		@hotel = Hotel.find(params[:id])
		 
		userId = @hotel.user_id
		sessionId = session[:user_id]
		if userId != sessionId
			redirect_to '/users/' +sessionId.to_s
		end
		 @countries = Country.all
	end
	
	def update
		@sessionId = get_session
		@hotel = Hotel.find(params[:id])
    		if @hotel.update_attributes(hotel_params)
      		redirect_to '/users/' +@sessionId.to_s
    	else
      		render 'edit'
    	end
	end
	
	private 
  	def hotel_params 
   		  params.require(:hotel).permit(:name, :image, :description, :user_id, :country_id, :postcode)
  	end
	
	private
	def get_session
 	return session[:user_id]
 end

end
