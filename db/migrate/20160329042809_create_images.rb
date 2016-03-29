class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :category, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true, null: false
      t.string :img_url, null: false

      t.timestamps null: false
    end
  end
end
