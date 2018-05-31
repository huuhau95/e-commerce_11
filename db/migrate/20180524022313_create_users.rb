class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.date :birthday
      t.integer :role
      t.string :remember_digest
      t.string :images

      t.timestamps
    end
  end
end
