class CreateItemPartAttributeOptions < ActiveRecord::Migration[8.0]
  def change
    create_table :item_part_attribute_options do |t|
      t.references :item_part_attribute, null: false, foreign_key: true
      t.string :name
      t.decimal :price
      t.integer :stock

      t.timestamps
    end
  end
end
