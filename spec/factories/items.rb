FactoryBot.define do
  factory :item do
    title         {Faker::Lorem.sentence}
    description   {Faker::Lorem.sentence}
    price         {Faker::Number.between(from: 300, to: 9999999)}
    category_id   {2}
    state_id      {2}
    payed_id      {2}
    area_id       {2}
    progress_id   {2}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'test_image.png')
    end
  end
end
