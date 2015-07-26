class HotelController < ApplicationController
 def show
  @hotel = Hotel.find(params[:id])
  @comments = @hotel.comments
 end
end
