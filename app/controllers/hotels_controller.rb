class HotelsController < ApplicationController
 
 def new
 	 @countries = Country.all
	 @hotel = Hotel.new
 end
 
 def show
  @hotel = Hotel.find(params[:id])
  @comments = @hotel.comments
  @comment_id = Comment.find(1)
  @author = @comment_id.author_id
  @author = Author.find(@author)
 end
 
 def create
	@hotel = Hotel.new()
	@hotel.save!
		
		 
	end
	
	private 
  	def hotel_params 
   		  params.require(:hotel).permit(:name, :description, :owner_id, :country_id)
  	end

end
