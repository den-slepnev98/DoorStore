class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer :width, null: false
      t.integer :height, null: false
      t.boolean :opening_left, default: true
      t.text :comment
      t.references :door, foreign_key: true

      t.timestamps
    end
  end
end
