class CreatePictures < ActiveRecord::Migration[5.0]
  def change
    create_table :pictures do |t|
      t.text    :image, null: false
      t.references :product, null: false, foreign_key: true
      t.timestamps
    end
  end
end
