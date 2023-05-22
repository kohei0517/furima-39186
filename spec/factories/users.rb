FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length:4)}
    password_confirmation {password}
    name                  {"田中"}
    f_name                {"太郎"}
    name_kana             {"タナカ"}
    f_name_kana           {"タロウ"}
    birthday              {Faker::Date.backward}
  end
end

