module Mutations
    class DeleteItemPartAttributeOption< BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:)
        item_part_attribute_option = ItemPartAttributeOption.find_by(id: id)
        if item_part_attribute_option
            item_part_attribute_option.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: ['Opció no trobada'] }
        end
      end
    end
  end
  