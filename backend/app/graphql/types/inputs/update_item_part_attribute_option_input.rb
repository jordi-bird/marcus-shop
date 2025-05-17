module Types
    module Inputs
        class UpdateItemPartAttributeOptionInput < Types::BaseInputObject
        argument :id, ID, required: true
        argument :name, String, required: false
        argument :price, Float, required: false
        argument :stock, Integer, required: false
        argument :rules, [Types::RuleInputType], required: false
        end
    end
  end