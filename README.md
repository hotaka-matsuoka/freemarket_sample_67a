# アプリ概要
誰でも簡単に売買ができる、フリーマーケットのアプリケーションを作成しました。  
下記ページで公開中です。  
http://54.168.237.82/

## 機能
- ユーザー登録機能
- ログイン・ログアウト機能
- 商品出品機能
- 商品検索機能
- 商品購入機能
- 商品取引機能
- 商品お気に入り機能
- 商品コメント機能
- ページネーション機能
- マイページ機能
- カテゴリ区別、検索機能
- ブランド区別、検索機能

## 使用技術
- Ruby 2.6.3
- Ruby on Rails 5.2.4
- HTML / CSS / Haml / Scss
- JavaScript / jQuery / Ajax
- MySQL 5.8
- unicorn
- nginx
- AWS EC2
- AWS S3

## 動作確認方法
Chromeの最新版を利用してアクセスしてください。  

ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続ください。  

接続先およびログイン情報については、上記の通りです。   

同時に複数の方がログインしている場合に、ログインできない可能性がございます。  

### 出品方法は以下の手順で確認できます
テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品

### 購入方法は以下の手順で確認できます
テストアカウントでログイン→トップページから商品検索→商品選択→クレジットカード登録(カード情報は上述)→商品購入  
確認後、ログアウト処理（マイページ→サイドバーのログアウト押下→ログアウトするボタン押下）をお願いします。

### テスト用アカウント等
#### 購入者用
メールアドレス: buyer@gmail.com  
パスワード: password  
#### 購入用カード情報
番号: 4242424242424242  
期限: 22/01  
セキュリティコード: 123  
#### 出品者用
メールアドレス名: seller@gmail.com  
パスワード: password  

## 詳細
以下に制作物の詳細説明文があります。ぜひご覧ください。  
https://www.resume.id/works/5c189d35c1612993

## ER図
![er_table](https://user-images.githubusercontent.com/60139816/107105974-7f834c80-686c-11eb-9375-99b03bc80c4d.jpg)

## DB設計

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
|tel|integer|
## Association
- belongs_to_active_hash :prefecture
- belongs_to: user
- has_one:    purchase

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|reference|null: false, foreign_key: true|
|card_idinteger|null: false|
|customer_id|integer|null: false|
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
