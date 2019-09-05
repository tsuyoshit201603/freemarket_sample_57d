class CreateCommodityConditions < ActiveRecord::Migration[5.0]
  def change
    create_table :commodity_conditions do |t|
      t.string :condition, null: false
      t.timestamps
    end
  end
end
