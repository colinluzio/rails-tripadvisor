class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
	  t.references :hotel
	  t.references :user
	  t.date :startdate
	  t.date :enddate
	  t.string :comments
	  t.integer :status
      t.timestamps
    end
  end
end
