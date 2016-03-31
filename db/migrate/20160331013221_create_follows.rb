class CreateFollows < ActiveRecord::Migration
  def change
    create_table :follows do |t|
      t.references :user, index: true, foreign_key: true, null: false
      t.integer :follow_id, null: false

      t.timestamps null: false
    end
  end
end
