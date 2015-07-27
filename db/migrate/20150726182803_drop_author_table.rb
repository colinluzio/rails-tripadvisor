class DropAuthorTable < ActiveRecord::Migration
  def up
    drop_table :authors
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
