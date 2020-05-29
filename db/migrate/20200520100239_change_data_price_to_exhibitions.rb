class ChangeDataPriceToExhibitions < ActiveRecord::Migration[5.2]
  def change
    change_column :exhibitions, :price, :integer, null: false
  end
end
