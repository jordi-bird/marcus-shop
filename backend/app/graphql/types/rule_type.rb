# app/graphql/types/rule_type.rb
module Types
    class RuleType < BaseObject
      field :id, ID, null: false
      field :rule_type, String, null: false
      field :value, Float, null: true
      field :operation, String, null: true
      field :source_option, Types::ItemPartAttributeOptionType, null: true
      field :target_option, Types::ItemPartAttributeOptionType, null: true
      #field :target_part, Types::ItemPartType, null: true
      field :reciprocal, Boolean, null: false
      # IDs directes (per optimització o evitar nested queries)
    end
  end