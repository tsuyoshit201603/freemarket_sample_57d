class CreateCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, index: true
      t.string :ancestry, null: false, index: true
      t.timestamps
    end
  end
end
