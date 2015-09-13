class AddLatlongToHotels < ActiveRecord::Migration
  def change
    add_column :hotels, :lat, :float
    add_column :hotels, :long, :float
  end
end
