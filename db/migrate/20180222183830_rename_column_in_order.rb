class RenameColumnInOrder < ActiveRecord::Migration[5.0]
  def change
    rename_column :orders, :opening_left, :door_opening
  end
end
