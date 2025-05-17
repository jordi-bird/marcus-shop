module Mutations
    class CreateItem < BaseMutation
        argument :name, String, required: true
        argument :description, String, required: false

        field :success, Boolean, null: false 
        field :item, Types::ItemType, null: true
        field :errors, [String], null: false

        def resolve(name:, description: nil)
            item = Item.new(name: name, description: description)

            if item.save
                { success: true, item: item, errors: [] }
            else
                { success: false, item: nil, errors: item.errors.full_messages }
            end
        end
    end
  end
  