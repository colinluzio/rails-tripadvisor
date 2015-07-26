class Hotel < ActiveRecord::Base
 belongs_to :country
 has_many :comments
end
