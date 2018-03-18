class AddColumnsToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :user_name, :string, null: false
    add_column :orders, :user_phone, :string, null: false
    add_column :orders, :user_email, :string, null: false
    add_reference :orders, :material, foreign_key: true
  end
end
