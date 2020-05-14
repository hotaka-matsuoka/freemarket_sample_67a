crumb :root do
  link "トップページ", root_path
end

crumb :mypage do
  link "マイページ", mypage_path
end

crumb :logout do
  link "ログアウト", mypage_logout_path
  parent :mypage
end
crumb :categories do 
  link "カテゴリー一覧", categories_path
end

crumb :category do |category|
  link category.name, categories_path(category)
  parent :categories
end

crumb :brands do
  link "ブランド一覧", brands_path
end

crumb :brand do |brand|
  link brand.brand, brands_path(brand)
  parent :brands
end