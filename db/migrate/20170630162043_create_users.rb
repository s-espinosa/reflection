class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :nickname
      t.string :name
      t.string :email
      t.string :image_url
      t.string :token
      t.string :cohort
      t.integer :role, default: 0

      t.timestamps null: false
    end
  end
end
