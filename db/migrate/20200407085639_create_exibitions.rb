class CreateExibitions < ActiveRecord::Migration[5.2]
  def change
    create_table :exibitions do |t|
      t.string     :name,            null: false
      t.string     :explanation,     null: false
      t.string     :brand
      t.string     :shipping_charge, null: false
      t.string     :shipping_method, null: false
      t.string     :shipping_date,   null: false
      t.string     :price,           null: false
      t.string     :size,            null: false
      t.references :status,          null: false
      t.references :user,            null: false
      t.references :prefecture,      null: false  
      t.references :category,        null: false       
      t.timestamps
    end
  end
end
