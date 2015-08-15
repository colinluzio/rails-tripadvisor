class Comment < ActiveRecord::Base
 belongs_to :hotel, :foreign_key => "hotel_id"
 belongs_to:author, :foreign_key => "author_id"

end
