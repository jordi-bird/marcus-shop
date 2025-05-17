module Mutations
    class UpdateItem < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
  
      field :item, Types::ItemType, null: true
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:, name:, description: nil)
        item = Item.find_by(id: id)
  
        if item.nil?
          return { item: nil, success: false, errors: ['Item no trobat'] }
        end
  
        if item.update(name: name, description: description)
          { item: item, success: true, errors: [] }
        else
          { item: nil, success: false, errors: item.errors.full_messages }
        end
      end
    end
  end
  