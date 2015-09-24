class ChangeOwnerTo < ActiveRecord::Migration
  def change
  	rename_column :hotels, :owner_id, :user_id
  end
end
