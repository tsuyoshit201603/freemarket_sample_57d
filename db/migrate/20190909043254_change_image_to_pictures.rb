class ChangeImageToPictures < ActiveRecord::Migration[5.0]
  def change
    remove_column :pictures, :image
    add_column :pictures, :image, :string
  end
end
