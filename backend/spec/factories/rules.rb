FactoryBot.define do
    factory :rule do
      source_option { association(:item_part_attribute_option) }
      rule_type { "compatibility" }
  
      trait :with_target_option do
        target_option { association(:item_part_attribute_option) }
      end
  
      trait :price_modifier do
        rule_type { "price_modifier" }
        operation { "add" }
        value { 10.0 }
        target_option { association(:item_part_attribute_option) }
      end
    end
  end
  