FactoryBot.define do
    factory :recipe_food do
      association :recipe
      association :food
      quantity { 1 }
      trait :with_positive_quantity do
        quantity { 5 }
      end
      trait :with_zero_quantity do
        quantity { 0 }
      end
      trait :without_food do
        food { nil }
      end
    end
  end
  