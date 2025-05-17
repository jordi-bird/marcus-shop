module Mutations
    class CreateItemPartAttribute < BaseMutation
        argument :item_part_id, ID, required: true
        argument :name, String, required: true

        field :success, Boolean, null: false 
        field :item_part_attribute, Types::ItemPartAttributeType, null: true
        field :errors, [String], null: false

        def resolve(item_part_id:, name:)
            item_part_attribute = ItemPartAttribute.new(item_part_id:item_part_id, name: name)

            if item_part_attribute.save
                { success: true, item_part_attribute: item_part_attribute, errors: [] }
            else
                { success: false, item_part_attribute: nil, errors: item_part_attribute.errors.full_messages }
            end
        end
    end
  end
  