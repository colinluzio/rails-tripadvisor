class Comment < ActiveRecord::Base
 belongs_to :hotel
 belongs_to:author, :foreign_key => "author_id"

end
