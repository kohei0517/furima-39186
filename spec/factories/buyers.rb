FactoryBot.define do
  factory :buyer do
    zip_code  {}
    area_id   {}
    city      {}
    address   {}
    building  {}
    phone     {}
    association :buy
  end
end
