class CreateDoors < ActiveRecord::Migration[5.0]
  def change
    create_table :doors do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.decimal :min_price, precision: 5, scale: 2, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.string :photo
      t.references :material, foreign_key: true

      t.timestamps
    end
  end
end
