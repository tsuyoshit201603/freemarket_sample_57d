class Product < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many   :pictures, dependent: :destroy
  accepts_nested_attributes_for :pictures
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
  attr_accessor :change

  validates :name, presence: true
  validates :explain, presence: true
  validates :prefecture_id, presence: true
  validates :price, presence: true, numericality:{only_interger: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  validates :category_id, presence: true
  validates :size_id, presence: true
  validates :brand_id, presence: true
  validates :commodity_condition_id, presence: true
  validates :shipping_charge_id, presence: true
  validates :delivery_method_id, presence: true
  validates :days_before_shipment_id, presence: true
  validates :user_id, presence: true
  validates :condition_id, presence: true
end
