# FREEMARKET_SAMPLE_57D
## productsテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|name|string|null: false, index: true|
|explan|text|null: false|
|prefacuture_id|integer|null: false|
|price|integer|null: false|
|categorie|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|brand_id|interger|null: false, foreign_key: true|
|commodity_condition_id|interger|null: false, foreign_key: true|
|shipping_charge_id|interger|null: false, foreign_key: true|
|delivery_method_id|interger|null: false, foreign_key: true|
|days＿before＿shipment_id|interger|null: false, foreign_key: true|
|categorie_id|interger|null: false, foreign_key: true|
### Association
- has_many   :pictures
- belongs_to :categorie
- belongs_to :size
- belongs_to :brand
- belongs_to :commodity_condition
- belongs_to :shipping_charge
- belongs_to :delivery_method
- belongs_to :days_before_hipment
- has_many   :users_products, dependent: :destroy
- belongs_to :user
- belongs_to :condition, dependent: :destroy
- belongs_to_active_hash :prefecture
## picturesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null: false|
|product_id|interger|null: false, foreign_key: true|
### Association
- belongs_to :product
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|ancestry|string|null: false, index: true|
### Association
- has_many :products
- has_ancestry
## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|size|string|null: false, index: true|
### Association
- has_many :products
## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: true, index: true|
### Association
- has_many :products
## commodity_conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|condition|string|null: false|
### Association
- has_many :products
## shipping_chargesテーブル
|Column|Type|Options|
|------|----|-------|
|method|string|null: false|
### Association
- has_many :products
## delivery_methodsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many :products
## days_before_shipmentsテーブル
|Column|Type|Options|
|------|----|-------|
|days|string|null: false|
### Association
- has_many :products
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
|prefacture|integer|null: true|
|municipalities|string|null: true|
|address|string|null: true|
|buildingname|string|null: true|
|image|text|null: true|
|nickname|string|null: false|
|explan|text|null: true|
### Association
- belongs_to :sns_credential, dependent: :destroy
- has_many   :users_products, dependent: :destroy
- has_many   :products, through: :users_products, dependent: :destroy
- belongs_to_active_hash :prefecture
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
- has_many :projects











