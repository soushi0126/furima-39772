FactoryBot.define do
  factory :purchase_address do
    post_code               { '123-4567' }
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    municipalities          { '横浜市緑区' }
    street_address          { '3-3' }
    building                { '今村ビル301' }
    telephone               { '09011111111' }

    association :user
    association :item
  end
end
