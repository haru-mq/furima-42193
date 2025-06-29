FactoryBot.define do

  digit_count = rand(4..128)

  factory :user do
    transient do
      gimei_name { Gimei.name }
    end

    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.email}
    password              {Faker::Alphanumeric.alpha(number: digit_count) + "1a"}
    password_confirmation {password}
    first_name            {gimei_name.first.kanji}
    last_name             {gimei_name.last.kanji}
    first_name_kana       {gimei_name.first.katakana}
    last_name_kana        {gimei_name.last.katakana}
    birthday              {Faker::Date.birthday(min_age: 18, max_age: 90) }
  end
end