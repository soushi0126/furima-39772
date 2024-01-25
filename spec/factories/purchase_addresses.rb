FactoryBot.define do
  factory :purchase_address do
    post_code               do
      Faker::Number.leading_zero_number(digits: 3) + '-' +
        Faker::Number.leading_zero_number(digits: 4)
    end
    prefecture_id           { Faker::Number.between(from: 2, to: 48) }
    municipalities          { Faker::Address.city }
    street_address          { Faker::Address.street_address }
    building                { Faker::Company.name }
    telephone               { Faker::Number.leading_zero_number(digits: 11) }
    token                   { Faker::Alphanumeric.alphanumeric(number: 30) }

    association :user
    association :item
  end
end
