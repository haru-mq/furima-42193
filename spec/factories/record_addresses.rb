FactoryBot.define do
  factory :record_address do

    post_number     {"#{rand(100..999)}-#{rand(1000..9999)}"}
    prefecture_id   {rand(2..48)}
    city            {Faker::Address.city()}
    house_number    {Faker::Address.building_number()}
    building        {"#{Faker::Name.last_name()}ビル"}
    phone_number    {Faker::Number.number(digits: 11)}
    token           {"tok_abcdefghijk00000000000000000"}

    association :user
    association :item
  end
end
