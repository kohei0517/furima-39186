FactoryBot.define do
  factory :buy_buyer do
    zip_code  {"123-4567"}
    area_id   {"2"}
    city      {"新宿区"}
    address   {"広島"}
    building  {"ヤマハビル"}
    phone     {"12345678910"}
    token     {"tok_abcdefghijk00000000000000000"}
    user_id   {1}
    item_id   {1}
  end
end
