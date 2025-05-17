module Mutations
    class DeleteItemPart< BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:)
        item_part = ItemPart.find_by(id: id)
        if item_part
            item_part.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: ['Part de item no trobada'] }
        end
      end
    end
  end
  