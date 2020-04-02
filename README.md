# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# ER図
<https://www.lucidchart.com/documents/edit/38b8f983-3a34-4edb-83e1-4624d529adb1/iECLyY.Q7XgJ?shared=true#?folder_id=home&browser=icon>

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
|birth_year|integer|null: false|
|birth_month|integer|null: false|
|profile_img|string||
|self_introduction|string||
## Association
- has_one:  addresse
- has_one:  purchase
- has_one:  evaluation
- has_many: credit_cards
- has_many: exhibitions
- has_many: comments
- has_many: transactions

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|post_num|integer|null: false|
|prefecture|string|null: false|
|municipality|string|null: false|
|address|string|null: false|
|building_name|string||
|tel|string|null: false|
## Association
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
- has_many: users
- has_one:  purchase

## purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false|
|addresse_id|reference|null: false|
|exhibition_id|reference|null: false|
|credit_card_id|reference|null: false|
## Association
- belongs_to: credit_card
- belongs_to: addresse

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
|item_id|reference|null: false, foreign_key: true|
|text|string|null: false|
## Association
- belongs_to: users
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
|size|string|
|good|integer|
|shipping_charge|integer|null: false|
|shipping_method|intger|null: false|
|shipping_date|intger|null: false|
|prefecture|string|null: false|
|first_category_id|integer|null: false, foreign_key: true|
|second_category_id|integer|null: false, foreign_key: true|
|third_category_id|integer|null: false, foreign_key: true|
|bland_id|integer|null: false, foreign_key: true|
## Association
- belongs_to :user
- belongs_to :purchase
- belongs_to :address
- belongs_to :evaluation
- belongs_to :first_category
- belongs_to :second_category
- belongs_to :third_category
- belongs_to :bland
- has_many   :comments
- has_many   :transaction
- has_many   :images

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|exibition_id|reference|null: false, foreign_key: true|
## Association
- belongs_to :exibition

## first_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
## Association
- has_many :exibitions
- has_many :second_categories
- has_many :category_blands
- has_many :blands,  through :category_blands

## second_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|first_category_id|referense|null: false, foreign_key: true|
## Association
- belongs_to :first_category
- has_many   :exibitions
- has_many   :third_categories
- has_many   :category_blands
- has_many   :blands,  through :category_blands

## third_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|second_category_id|referense|null: false, foreign_key: true|
## Association
- belongs_to :second_category
- has_many   :exibitions
- has_many   :second_categories
- has_many   :category_blands
- has_many   :blands,  through :category_blands

## blandsテーブル
|Column|Type|Options|
|------|----|-------|
|bland|string|
## Association
- has_many: exhibitions
- has_many: bland_categories
- has_many: first_categories,  through :category_blands
- has_many: second_categories, through :category_blands
- has_many: third_categories,  through :category_blands