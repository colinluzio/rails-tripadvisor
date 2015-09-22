class PhotosController < ApplicationController

	def create
		@photo = Photo.new(photo_params)
		@photo.save 
		
	
	if(session[:hotel_photos]==nil)
		session[:hotel_photos]=[]
	end
	
	session[:hotel_photos].push(@photo.id)
	
		respond_to do |format|
			 format.json { render json: @photo}
  			 format.js   { render action: 'create', status: :created, location: @photo }
		end	 
	end
	
	private
	def photo_params 
   		  params.require(:photo).permit(:image)
  	end
end
