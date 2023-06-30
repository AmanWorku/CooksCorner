FactoryBot.define do
  factory :food do
    name { "MyString" }
    measurement_unit { "MyString" }
    price { 1.5 }
    quantity { 1 }
    user { association(:user) }

    trait :with_user do
      user { create(:user) }
    end
  end
end