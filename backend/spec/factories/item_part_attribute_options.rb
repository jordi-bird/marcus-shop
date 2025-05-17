FactoryBot.define do
    factory :item_part_attribute_option do
      item_part_attribute
      name { "Option #{rand(100)}" }
      price { rand(0.0..10.0).round(2) }
      stock { rand(0..100) }
    end
  end