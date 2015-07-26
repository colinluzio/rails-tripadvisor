class Comment < ActiveRecord::Base
 belongs_to :hotel
 belongs_to :author
end
