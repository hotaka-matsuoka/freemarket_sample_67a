FactoryBot.define do
  factory :exhibition do
    name                {"服"}
    explanation         {"これは服です"}
    brand               {"シャネル"}
    price               {"2000"}
    shipping_method_id  {1}
    shipping_date_id    {1}
    condition_id        {1}
    prefecture_id       {1}
    category_id         {1}
    user_id             {1}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    user
  end
end