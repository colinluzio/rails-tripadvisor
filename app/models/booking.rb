class Booking < ActiveRecord::Base
	has_one :hotel
	has_one :user
	before_save { |booking| booking.status = 0 }
	validate :is_information_valid
	
	private
	def is_information_valid

	# Get all user bookings at same hotel
	     
		@bookings = Booking.where(['user_id = ? and hotel_id = ?', self.user_id, self.hotel_id])
		
		@bookings.each do | i |
			if i.startdate == self.startdate
				 errors.add(:comments, "Not valid start date")
			end
			
		end
		
	end
end
