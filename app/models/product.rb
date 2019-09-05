class Product < ApplicationRecord
  has_many   :pictures
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :commodity_condition
  belongs_to :shipping_charge
  belongs_to :delivery_method
  belongs_to :days_before_hipment
  belongs_to :user
  has_one    :users_products, dependent: :destroy
  belongs_to :buyer, class_name: 'User', through: :users_products, dependent: :destroy
  belongs_to :condition, dependent: :destroy
  belongs_to_active_hash :prefecture
end
