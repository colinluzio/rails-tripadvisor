class DropCommentTable < ActiveRecord::Migration
   def up
    drop_table :comments
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end

end
