class RenameBrandIdColumnToExibitions < ActiveRecord::Migration[5.2]
  def change
    change_column :exibitions, :brand_id, :string
    rename_column :exibitions, :brand_id, :brand_name
  end
end
