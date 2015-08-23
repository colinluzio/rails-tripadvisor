class AddOwnerToHotel < ActiveRecord::Migration
  def change
    add_column :hotels, :owner_id, :integer, references: :owner
  end
end
