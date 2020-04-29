class AddSalesStatusExhibitions < ActiveRecord::Migration[5.2]
  def change
    add_column :exhibitions, :sales_status, :integer, default: 0
  end
end
