class Hotel < ActiveRecord::Base
 belongs_to :country
 belongs_to :owner, :foreign_key => "owner_id"
 has_many :comments
 
 has_attached_file :photo,
 :url => "/images/:attachment/:basename.:extension",
 :path => ":rails_root/public/images/:attachment/:basename.:extension"
 attr_accessible :photo
end
