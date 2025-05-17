FactoryBot.define do
    factory :item_part_attribute do
      item_part
      name { "Attribute #{rand(100)}" }
    end
  end
  