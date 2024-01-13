FactoryBot.define do
  factory :item do
    name                  { Faker::Game.title }
    description           { Faker::Lorem.sentence }
    category_id           { Faker::Number.between(from: 2, to:11 ) }
    situation_id          { Faker::Number.between(from: 2, to:7 ) }
    delivery_load_id      { Faker::Number.between(from: 2, to:3 ) }
    prefecture_id         { Faker::Number.between(from: 2, to:48 ) }
    shipping_day_id       { Faker::Number.between(from: 2, to:4 ) }
    price                 { Faker::Number.between(from: 300, to: 9999999)}
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
    association :user
  end
end
