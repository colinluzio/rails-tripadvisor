class Photo < ActiveRecord::Base
mount_uploader :image, ImageUploader
belongs_to :hotel, :foreign_key => "hotel_id"
end
