class CreateCategoryBlands < ActiveRecord::Migration[5.2]
  def change
    create_table :category_brands do |t|
      t.references :category,  foreing_key: true
      t.references :brand,  foreing_key: true
      t.timestamps
    end
  end
end
