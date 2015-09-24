class Hotel < ActiveRecord::Base
 belongs_to :country
 belongs_to :user, :foreign_key => "user_id"
 has_many :comments
 has_many :photos
 mount_uploader :image, ImageUploader
 before_save :get_latlong
 
 def get_latlong
 	 # Get longitude and latitude from Google maps
	 
	encoded_url = URI.encode("http://maps.googleapis.com/maps/api/geocode/xml?address=#{self.postcode},#{self.country}&sensor=false")
	@xml_doc = Nokogiri::XML(open(encoded_url).read)
	self.lat  =  @xml_doc.xpath("//GeocodeResponse//result//geometry//location//lat").text
	self.long = @xml_doc = @xml_doc.xpath("//GeocodeResponse//result//geometry//location//lng").text
 end
 def newid
 	return 'hello'
 end
 def newname
 	return self.newid
 end
end
