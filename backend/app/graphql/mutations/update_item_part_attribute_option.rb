# app/graphql/mutations/update_item_part_attribute_option.rb
module Mutations
    class UpdateItemPartAttributeOption < BaseMutation
      argument :input, Types::Inputs::UpdateItemPartAttributeOptionInput, required: true
  
      field :item_part_attribute_option, Types::ItemPartAttributeOptionType, null: true
      field :errors, [String], null: false
      field :success, Boolean, null: false
  
      def resolve(input:)
        option = ItemPartAttributeOption.find_by(id: input.id)
        return { item_part_attribute_option: nil, errors: ["Opció no trobada"], success: false } unless option
  
        option.name = input.name if input.name
        option.price = input.price if input.price
        option.stock = input.stock if input.stock
  
        # Gestió de les regles (esborra i recrea)
        if input.rules
            option.source_rules.destroy_all

            # Esborra també regles recíproques on aquesta opció és la target
            Rule.where(
              target_option_id: option.id,
              reciprocal: true
            ).destroy_all
  
          input.rules.each do |rule|
            option.source_rules.build(
              rule_type: rule.rule_type,
              source_option_id: rule.source_option_id,
              target_option_id: rule.target_option_id,
              reciprocal: rule.reciprocal,
              operation: rule.operation,
              value: rule.value
            )
          end
        end
  
        if option.save
          { item_part_attribute_option: option, errors: [], success: true }
        else
          { item_part_attribute_option: nil, errors: option.errors.full_messages, success: false }
        end
      end
    end
  end
  