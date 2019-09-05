class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.integer :postalcode, null: true
      t.integer :prefecture, null: true
      t.string  :municipalities, null: true
      t.string  :address, null: true
      t.string  :buildingname, null: true
      t.timestamps
    end
  end
end
