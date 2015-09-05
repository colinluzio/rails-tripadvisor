class Country < ActiveRecord::Base
has_many :hotels

	def self.get_countries
		Rails.cache.fetch([self,"countries"]){Country.all}
	end
end
