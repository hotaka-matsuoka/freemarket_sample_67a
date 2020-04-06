FactoryBot.define do

  factory :address do
    zipcode       {"1234567"}
    municipality  {"横浜市緑区"}
    address       {"青山1-1-1"}
    prefecture_id {14}
    user_id       {1}
    building_name {"柳ビル"}
    tel           {"19012345678"}
  end

end