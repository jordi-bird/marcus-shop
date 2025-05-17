class CreateItemParts < ActiveRecord::Migration[8.0]
  def change
    create_table :item_parts do |t|
      t.references :item, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.references :parent, foreign_key: { to_table: :item_parts }, null: true

      t.timestamps
    end
  end
end