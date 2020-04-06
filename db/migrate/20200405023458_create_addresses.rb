class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string      :zipcode,       null:false 
      t.string      :municipality,  null:false
      t.string      :address,       null:false
      t.references  :prefecture,    null:false
      t.references  :user,          null:false
      t.string      :building_name
      t.string      :tel
      t.timestamps
    end
  end
end
