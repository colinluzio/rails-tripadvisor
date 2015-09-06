class AddPostcodeHotels < ActiveRecord::Migration
  def change
  	add_column :hotels, :postcode, :string
  end
end
