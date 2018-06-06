class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :image
      t.string :password_digest
      t.date :birthday
      t.integer :role, default: false
      t.string :remember_digest
      t.string :image

      t.timestamps
    end
  end
end
