FactoryBot.define do

  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"田中"}
    first_name            {"彩"}
    family_name_kana      {"タナカ"}
    first_name_kana       {"アヤ"}
    birth_day             {"1930-01-01"}
  end

end