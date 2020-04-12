FactoryBot.define do

  factory :image do
    image_url     {File.open("#{Rails.root}/public/images/image_url/test.jpg")}
    exhibition
  end

end