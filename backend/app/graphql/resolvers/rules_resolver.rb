# app/graphql/resolvers/rules_resolver.rb
module Resolvers
    class RulesResolver < BaseResolver
      type [Types::RuleType], null: true
  
      argument :item_part_attribute_option_id, ID, required: false
      argument :item_part_option_id, ID, required: false
  
      def resolve(item_part_attribute_option_id: nil, item_part_option_id: nil)
        rules = Rule.all
  
        if item_part_attribute_option_id
          rules = rules.where(source_option_id: item_part_attribute_option_id)
                        .or(rules.where(target_option_id: item_part_attribute_option_id))
        end
  
        # if item_part_option_id
        #   rules = rules.where(target_part_id: item_part_option_id)
        # end
  
        rules
      end
    end
  end
  