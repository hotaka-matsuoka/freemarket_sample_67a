FactoryBot.define do
  factory :address do
    zipcode       {Faker::Number.number(digits: 7)}
    municipality  {Gimei.city.to_s}
    address       {Gimei.town.to_s}
    prefecture_id {14}
    user_id       {1}
    building_name {"柳ビル"}
    tel           {Faker::Number.leading_zero_number(digits: 11)}
  end
end