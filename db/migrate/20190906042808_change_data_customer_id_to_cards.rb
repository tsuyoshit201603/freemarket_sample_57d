class ChangeDataCustomerIdToCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :customer_id, :string
  end
end
