class Hotel < ActiveRecord::Base
 belongs_to :country
 belongs_to :owner, :foreign_key => "owner_id"
 has_many :comments
 
 mount_uploader :image, ImageUploader
 before_save :get_latlong
 
 def get_latlong
 	 # Get longitude and latitude from Google maps
	 
	encoded_url = URI.encode("http://maps.googleapis.com/maps/api/geocode/xml?address=#{self.postcode},#{self.country}&sensor=false")
	@xml_doc = Nokogiri::XML(open(encoded_url).read)
	self.lat  =  @xml_doc.xpath("//GeocodeResponse//result//geometry//location//lat").text
	self.long = @xml_doc = @xml_doc.xpath("//GeocodeResponse//result//geometry//location//lng").text
 end
end
