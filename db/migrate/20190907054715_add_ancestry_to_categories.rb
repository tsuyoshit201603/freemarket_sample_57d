class AddAncestryToCategories < ActiveRecord::Migration[5.0]
  def change
    remove_column :categories, :ancestry
    add_column :categories, :ancestry, :string
    add_index :categories, :ancestry
  end
end
