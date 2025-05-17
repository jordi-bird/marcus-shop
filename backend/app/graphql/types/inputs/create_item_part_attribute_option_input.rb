module Types
    module Inputs
      class CreateItemPartAttributeOptionInput < Types::BaseInputObject
        argument :item_part_attribute_id, ID, required: true
        argument :name, String, required: true
        argument :price, Float, required: true
        argument :stock, Integer, required: true
        argument :rules, [Types::RuleInputType], required: false
      end
    end
  end