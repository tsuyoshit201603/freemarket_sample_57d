class CreateDaysBeforeShipments < ActiveRecord::Migration[5.0]
  def change
    create_table :days_before_shipments do |t|
      t.string :days, null: false
      t.timestamps
    end
  end
end
