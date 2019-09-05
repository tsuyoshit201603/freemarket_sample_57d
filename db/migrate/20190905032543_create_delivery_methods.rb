class CreateDeliveryMethods < ActiveRecord::Migration[5.0]
  def change
    create_table :delivery_methods do |t|
      t.string :name, null: false
      t.timestamps
    end
  end
end
