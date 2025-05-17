FactoryBot.define do
    factory :item_part do
      item
      name { "Part #{rand(100)}" }
    end
  end