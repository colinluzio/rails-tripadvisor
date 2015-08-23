class Owner < ActiveRecord::Base
has_one :hotel
has_one :country
end
