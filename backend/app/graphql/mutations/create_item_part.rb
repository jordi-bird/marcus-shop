module Mutations
    class CreateItemPart < BaseMutation
        argument :item_id, ID, required: true
        argument :name, String, required: true
        argument :description, String, required: false
        argument :parent_id, ID, required: false


        field :success, Boolean, null: false 
        field :item_part, Types::ItemPartType, null: true
        field :errors, [String], null: false

        def resolve(item_id:, name:, description: nil, parent_id: nil)
            item_part = ItemPart.new(item_id:item_id, name: name, description: description, parent_id:parent_id)

            if item_part.save
                { success: true, item_part: item_part, errors: [] }
            else
                { success: false, item_part: nil, errors: item_part.errors.full_messages }
            end
        end
    end
  end
  