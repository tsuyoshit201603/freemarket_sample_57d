class Product < ApplicationRecord
  has_many   :pictures
  belongs_to :category
  belongs_to :size
  belongs_to :brand
  belongs_to :commodity_condition
  belongs_to :shipping_charge
  belongs_to :delivery_method
  belongs_to :days_before_hipment
  has_many   :users_products, dependent: :destroy
  belongs_to :user
  belongs_to :condition, dependent: :destroy
  belongs_to_active_hash :prefecture
end
