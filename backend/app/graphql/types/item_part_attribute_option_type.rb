module Types
    class ItemPartAttributeOptionType < Types::BaseObject
      field :id, ID, null: false
      field :name, String, null: false
      field :price, Float, null: false
      field :stock, Integer, null: false
      field :rules, [Types::RuleType], null: true, description: "Les regles associades a aquesta opció d'atribut"
    end
  end
  