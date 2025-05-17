module Types
    class ItemType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :description, String, null: true
      field :item_parts, [Types::ItemPartType], null: false
    end
  end
  