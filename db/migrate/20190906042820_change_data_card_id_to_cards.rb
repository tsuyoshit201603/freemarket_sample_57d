class ChangeDataCardIdToCards < ActiveRecord::Migration[5.0]
  def change
    change_column :cards, :card_id, :string
  end
end
