class Booking < ActiveRecord::Base
	has_one :hotel
	has_one :user
	before_save { |booking| booking.status = 0 }
end
