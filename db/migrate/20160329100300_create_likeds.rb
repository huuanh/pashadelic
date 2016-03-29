class CreateLikeds < ActiveRecord::Migration
  def change
    create_table :likeds do |t|
      t.references :user, index: true, foreign_key: true
      t.references :image, index: true, foreign_key: true
    end
  end
end
