class Add < ActiveRecord::Migration
  def change
  	 add_column :users, :country_id, :integer
	 add_column :users, :phone, :string
  end
end
