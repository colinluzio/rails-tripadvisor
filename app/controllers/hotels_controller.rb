class HotelsController < ApplicationController
 
 def new
	 @countries = Country.all
	 @hotel = Hotel.new
	 @photo = Photo.new
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
	
	private 
  	def hotel_params 
   		  params.require(:hotel).permit(:name, :image, :description, :user_id, :country_id, :postcode)
  	end

end
