class CreateOwners < ActiveRecord::Migration
  def change
    create_table :owners do |t|
	  t.string :name
	  t.integer :age
	  t.references :country
	  t.string :town
      t.timestamps
    end
  end
end
