class CreatePicks < ActiveRecord::Migration
  def change
    create_table :picks do |t|
		t.datetime "created_at",  null: false
    	t.datetime "updated_at",  null: false
    	t.string   "description", null: false
   		t.datetime "deadline"
    end
  end
end
