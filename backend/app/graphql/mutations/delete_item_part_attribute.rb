module Mutations
    class DeleteItemPartAttribute< BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:)
        item_part_attribute = ItemPartAttribute.find_by(id: id)
        if item_part_attribute
            item_part_attribute.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: ['Atribut de item no trobada'] }
        end
      end
    end
  end
  