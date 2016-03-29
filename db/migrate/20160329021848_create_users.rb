class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, default: ''
      t.string :username, null: false, unique: true
      t.string :email, null: false, unique: true
      t.string :password_digest, null: false
      t.boolean :visible, default: true
      t.boolean :admin, default: false

      t.timestamps null: false
    end
  end
end
