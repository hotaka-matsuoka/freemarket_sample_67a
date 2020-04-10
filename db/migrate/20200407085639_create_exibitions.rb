class CreateExibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exhibitions do |t|
      t.string     :name,            null: false
      t.string     :explanation,     null: false
      t.string     :brand
      t.string     :price,           null: false
      t.references :shipping_method, null: false
      t.references :shipping_date,   null: false
      t.references :status,          null: false
      t.references :user,            null: false
      t.references :prefecture,      null: false  
      t.references :category,        null: false       
      t.timestamps
    end
  end
end
