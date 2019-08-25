# FREEMARKET_SAMPLE_57D
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false, index: true|
|explan|text|null: false|
|prefacuture|string|null: false, index: true|
|price|integer|null: false|
### Association
- has_many :a_categories
- has_many :commodity_conditions
- has_many :shipping_charges
- has_many :days_before_hipments
- has_many :users_products
- has_many :users, through: :users_products
- belongs_to :condition
## a_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :project
- has_many :b_categories
## b_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|a_categorie_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :a_categorie
- has_many :c_categories
## c_categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|b_categorie_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :b_categorie
- has_many :sizes
- has_many :brands
## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false, index: true|
|c_categorie_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :c_categorie
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: true, index: true|
|c_categorie_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :c_categorie
## commodity_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :prodect
## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :prodect
- has_many : delivery_methods
## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|shipping_charge_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :shipping_charge
## days_before_shipmentsテーブル
|Column|Type|Options|
|------|----|-------|
|days|string|null: false|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :product
## users_productsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|interger|null: false, foreign_key: true|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :product
- belongs_to :user
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|cana|string|null: false|
|birthday|string|null: false|
|postalcode|interger|null: true|
|prefacture|string|null: true, index:true|
|municipalities|string|null: true|
|address|string|null: true|
|buildingname|string|null: true|
|image|text|null: true|
|nickname|string|null: false|
|explan|text|null: true|
### Association
- has_many :sns_credentials
- has_many : users_products
- has_many : products, through: :users_products
## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|user_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :user
## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- belongs_to :project











