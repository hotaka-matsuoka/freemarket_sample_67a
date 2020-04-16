class CreateBlands < ActiveRecord::Migration[5.2]
  def change
    create_table :brands do |t|
      t.string :brand,    index: true
      t.timestamps
    end
  end
end
