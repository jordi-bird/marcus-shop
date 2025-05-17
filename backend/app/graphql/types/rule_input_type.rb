module Types
    class RuleInputType < Types::BaseInputObject
      argument :rule_type, String, required: true
      argument :source_option_id, ID, required: true
      argument :target_option_id, ID, required: true
      argument :reciprocal, Boolean, required: true
      argument :operation, String, required: false
      argument :value, Float, required: false
    end
  end 