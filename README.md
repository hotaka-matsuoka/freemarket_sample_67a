# URL
http://54.168.237.82/
# 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.4
- HTML / CSS
- JavaScript / jQuery / Ajax
## データベース
- MySQL
## WEBサーバ
- nginx
## インフラ
- AWS

# 詳細
https://www.resume.id/works/5c189d35c1612993

# ER図
<https://www.lucidchart.com/documents/edit/38b8f983-3a34-4edb-83e1-4624d529adb1/iECLyY.Q7XgJ?shared=true#?folder_id=home&browser=icon>

# 工夫したところ
- N + 1 問題を意識したパフォーマンス
- 一部非同期通信を使用したユーザーストレスの軽減
- Rspecを取り入れたバグの検知

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birth_day|date|null: false|
|profile_img|string|
|self_introduction|text|
## Association
- has_one:  address, dependent: :destroy
- has_one:  purchase, dependent: :destroy
- has_one:  evaluation, dependent: :destroy
- has_many: credit_cards, dependent: :destroy
- has_many: exhibitions, dependent: :destroy
- has_many: comments
- has_many: transactions

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|zipcode|string|null: false|
|prefecture_id|reference|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string|
|tel|string|
## Association
- belongs_to_active_hash :prefecture
- belongs_to: user
- has_one:    purchase

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|card_num|integer|null: false, unique: true|
|year|integer|null: false|
|day|integer|null: false|
|security_code|integer|null: false|
## Association
- belongs_to: user
- has_one:  purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|address_id|reference|null: false, foreign_key: true|
|exhibition_id|reference|null: false, foreign_key: true|
|credit_card_id|reference|null: false, foreign_key: true|
## Association
- belongs_to: credit_card
- belongs_to: address
- belongs_to: user
- belongs_to: exibition

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_user_id|reference|null: false, foreign_key: true|
|buyer_user_id|reference|null: false, foreign_key: true|
|item_id|reference|null: false, foreign_key: true|
|text|string|null: false|
## Association
- belongs_to: user
- belongs_to: exhibition

## transactionsテーブル
|Column|Type|Options|
|------|----|-------|
|seller_user_id|reference|null: false, foreign_key: true|
|buyer_user_id|reference|null: false, foreign_key: true|
|exibition_id|reference|null: false, foreign_key: true|
|text|string|null: false|
## Association
- belongs_to: user
- belongs_to: exhibition

## evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|exhibition_id|reference|null: false, foreign_key: true|
|good|integer||
|usually|integer||
|bad|integer||
## Association
- belongs_to: user
- belongs_to: exhibition

## exibitionsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|name|string|null: false|
|price|integer|null: false|
|explanation|string|null: false|
|status|string|null: false|
|size|string|null: false|
|good|integer|
|shipping_charge|integer|null: false|
|shipping_method|intger|null: false|
|shipping_date|intger|null: false|
|prefecture|string|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :purchase
- belongs_to :address
- belongs_to :evaluation
- belongs_to :category
- belongs_to :brand
- has_many   :comments
- has_many   :transaction
- has_many   :images, dependent: :destroy

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|exibition_id|reference|null: false, foreign_key: true|
## Association
- belongs_to :exibition

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|path|string|
## Association
- has_many :exibitions
- has_many :category_brands
- has_many :brands,  through :category_brands

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|brand|string|
## Association
- has_many: exhibitions
- has_many: brand_categories
- has_many: categories,  through :category_brands
