FactoryBot.define do
  factory :item do
    item_name                 {Faker::Commerce.product_name()}
    item_description          {Faker::Lorem.paragraph()}
    category_id               {rand(2..11)}
    condition_id              {rand(2..6)}
    fee_id                    {rand(2..3)}
    prefecture_id             {rand(2..48)}
    ship_date_id              {rand(2..4)}
    price                     {rand(300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/image_office.png'), filename: 'image_office.png')
    end
  end
end
