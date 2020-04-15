class AddIndexToExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :sales_status, :integer, default: 0
    add_index  :exhibitions, :sales_status
  end
end
