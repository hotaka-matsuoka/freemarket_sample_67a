class CreateFavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.integer :user_id,       null: false, foreign_key: true
      t.integer :exhibition_id, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, :user_id
    add_index :favorites, :exhibition_id
    add_index :favorites, [:user_id, :exhibition_id], unique: true
  end
end
