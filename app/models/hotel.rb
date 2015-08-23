class Hotel < ActiveRecord::Base
 belongs_to :country
 belongs_to :owner, :foreign_key => "owner_id"
 has_many :comments
end
