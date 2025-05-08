class CreateItemPartAttributes < ActiveRecord::Migration[8.0]
  def change
    create_table :item_part_attributes do |t|
      t.references :item_part, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
