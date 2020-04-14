class CreateCategoryBlands < ActiveRecord::Migration[5.2]
  def change
    create_table :category_blands do |t|
      t.references :category,  foreing_key: true
      t.references :bland,  foreing_key: true
      t.timestamps
    end
  end
end
