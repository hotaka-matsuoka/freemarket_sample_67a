FactoryBot.define do
  factory :user do
    password = Faker::Internet.password(min_length: 8)
    nickname              {Gimei.hiragana}
    email                 {Faker::Internet.free_email}
    password              {password}
    password_confirmation {password}
    family_name           {Gimei.last.kanji}
    first_name            {Gimei.first.kanji}
    family_name_kana      {Gimei.last.katakana}
    first_name_kana       {Gimei.first.katakana}
    birth_day             {Faker::Date.birthday(min_age: 18, max_age: 65)}
  end
end