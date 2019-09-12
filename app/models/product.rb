class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many   :pictures, dependent: :destroy
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :commodity_condition
  belongs_to :shipping_charge
  belongs_to :delivery_method
  belongs_to :days_before_shipment
  belongs_to :user
  has_one    :users_product, dependent: :destroy
  has_one :buyer, class_name: 'User', through: :users_products, dependent: :destroy
  belongs_to :condition
  belongs_to_active_hash :prefecture
end
