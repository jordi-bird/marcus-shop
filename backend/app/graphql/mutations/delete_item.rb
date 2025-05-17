module Mutations
    class DeleteItem < BaseMutation
      argument :id, ID, required: true
  
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:)
        item = Item.find_by(id: id)
        if item
          item.destroy
          { success: true, errors: [] }
        else
          { success: false, errors: ['Item no trobat'] }
        end
      end
    end
  end
  