module Mutations
    class UpdateItemPart < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :description, String, required: false
      argument :parent_id, ID, required: false
  
      field :item_part, Types::ItemPartType, null: true
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:, name:, description: nil, parent_id: nil)
        item_part = ItemPart.find_by(id: id)
  
        if item_part.nil?
          return { item_part: nil, success: false, errors: ['Part no trobada'] }
        end
  
        if item_part.update(name: name, description: description, parent_id: parent_id)
          { item_part: item_part, success: true, errors: [] }
        else
          { item_part: nil, success: false, errors: item_part.errors.full_messages }
        end
      end
    end
  end
  