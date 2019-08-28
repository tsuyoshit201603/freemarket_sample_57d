class CreateSnsCredentials < ActiveRecord::Migration[5.0]
  def change
    create_table :sns_credentials do |t|
      t.string  :uid,      null:true
      t.string  :provider, null:true
      t.references :user

      t.timestamps
    end
  end
end
