module Mutations
    class UpdateItemPartAttribute < BaseMutation
      argument :id, ID, required: true
      argument :name, String, required: true
  
      field :item_part_attribute, Types::ItemPartAttributeType, null: true
      field :success, Boolean, null: false
      field :errors, [String], null: false
  
      def resolve(id:, name:)
        item_part_attribute = ItemPartAttribute.find_by(id: id)
  
        if item_part_attribute.nil?
          return { item_part_attribute: nil, success: false, errors: ['Atribut no trobat'] }
        end
  
        if item_part_attribute.update(name: name)
          { item_part_attribute: item_part_attribute, success: true, errors: [] }
        else
          { item_part_attribute: nil, success: false, errors: item_part_attribute.errors.full_messages }
        end
      end
    end
  end
  