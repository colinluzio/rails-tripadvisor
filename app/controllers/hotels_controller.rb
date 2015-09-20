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
	session[:hotel_number]=[]	
	if(session[:hotel_number]==nil)
		session[:hotel_number]=[]
	end
	session[:hotel_number].push(@hotel.id)
	print session[:hotel_number]
	respond_to do |format|
			 format.json { render json: @hotel}
  			 format.js   { render action: 'create', status: :created, location: @hotel }
		end	 
	end
	
	private 
  	def hotel_params 
   		  params.require(:hotel).permit(:name, :image, :description, :owner_id, :country_id, :postcode)
  	end

end
