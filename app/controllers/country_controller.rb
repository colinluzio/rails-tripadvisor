class CountryController < ApplicationController
 
def index
    @countries = Country.all
  end
 def show
  @country = Country.find(params[:id]) 
  @hotels = @country.hotels
  end 
end
