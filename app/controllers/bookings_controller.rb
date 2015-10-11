class BookingsController < ApplicationController
	 def new
	 	@booking = Booking.new
 	 end
	def create
		@booking = Booking.new(booking_params)
		@booking.status = 0
		@booking.save
	end
	
	private
	
	def booking_params
    	params.require(:booking).permit(:user_id, :hotel_id, :comments, :startdate, :enddate, :status)
  	end
end
