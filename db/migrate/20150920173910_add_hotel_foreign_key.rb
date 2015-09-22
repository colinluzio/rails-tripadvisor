class AddHotelForeignKey < ActiveRecord::Migration
  def change
  	 add_column :photos, :hotel_id, :integer
  end
end
