class AddStarsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :stars, :integer
  end
end
