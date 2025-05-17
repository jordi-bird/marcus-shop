class CreateRules < ActiveRecord::Migration[8.0]
  def change
    create_table :rules do |t|
      # Enllaços opcionals segons el tipus de regla
      t.references :source_option, null: false, foreign_key: { to_table: :item_part_attribute_options }
      t.references :target_option, foreign_key: { to_table: :item_part_attribute_options }
      #t.references :target_part, foreign_key: { to_table: :item_parts }

      # Tipus de regla: compatibility, incompatibility, price_modifier, etc.
      t.string :rule_type, null: false

      # Per modificadors de preu
      t.decimal :value, precision: 10, scale: 2
      t.string :operation # "add", "multiply", etc.

      # Reciprocalitat
      t.boolean :reciprocal, default: false, null: false

      t.timestamps
    end
  end
end