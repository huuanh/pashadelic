class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.references :image, index: true, foreign_key: true, null: false
      t.integer :parent_id, default: 0
      t.text :content, default: '', null: false

      t.timestamps null: false
    end
  end
end
