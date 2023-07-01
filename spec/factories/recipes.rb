FactoryBot.define do
    factory :recipe do
      public_recipe { false }
      created_at { Time.current }
      association :user, factory: :user
    end
  end
  