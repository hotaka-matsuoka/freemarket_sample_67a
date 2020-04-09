class RenameExbitionColumnToImages < ActiveRecord::Migration[5.2]
  def change
    rename_column :images, :exbition_id, :exibition_id
  end
end
