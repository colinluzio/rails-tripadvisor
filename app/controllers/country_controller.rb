class CountryController < ApplicationController
 
def index
    @countries = Country.get_countries
  end
 def show
  @country = Country.find(params[:id]) 
  @hotels = @country.hotels
  end 
end
