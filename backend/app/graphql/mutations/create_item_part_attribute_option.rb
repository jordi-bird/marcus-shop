module Mutations
    class CreateItemPartAttributeOption < BaseMutation
      argument :input, Types::Inputs::CreateItemPartAttributeOptionInput, required: true
  
      field :success, Boolean, null: false
      field :item_part_attribute_option, Types::ItemPartAttributeOptionType, null: true
      field :errors, [String], null: false
  
      def resolve(input:)
        option = ItemPartAttributeOption.new(
          item_part_attribute_id: input.item_part_attribute_id,
          name: input.name,
          price: input.price,
          stock: input.stock
        )
  
        # Creació de les rules
        if input.rules.present?
          input.rules.each do |rule_input|
            option.rules.build(
              rule_type: rule_input.rule_type,
              target_option_id: rule_input.target_option_id,
              reciprocal: rule_input.reciprocal,
              operation: rule_input.operation,
              value: rule_input.value
            )
          end
        end
  
        if option.save
          {
            success: true,
            item_part_attribute_option: option,
            errors: []
          }
        else
          {
            success: false,
            item_part_attribute_option: nil,
            errors: option.errors.full_messages
          }
        end
      end
    end
  end
  