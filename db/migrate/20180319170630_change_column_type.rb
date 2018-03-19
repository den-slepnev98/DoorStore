class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :orders, :door_opening, :string
  end
end
