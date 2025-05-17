module Types
    class ItemPartAttributeType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :item_part_attribute_options, [Types::ItemPartAttributeOptionType], null: false
    end
  end
  