class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table    :products do |t|
      t.string      :name, null: false, index: true
      t.text        :explain, null: false
      t.integer     :prefecture_id, null: false
      t.integer     :price, null: false
      t.references  :category, foreign_key: true
      t.references  :size, foreign_key: true
      t.references  :brand, foreign_key: true
      t.references  :commodity_condition, foreign_key: true
      t.references  :shipping_charge, foreign_key: true
      t.references  :delivery_method, foreign_key: true
      t.references  :days_before_shipment, foreign_key: true
      t.references  :user, foreign_key: true
      t.references  :condition, foreign_key: true
      t.timestamps
    end
  end
end
