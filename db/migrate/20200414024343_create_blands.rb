class CreateBlands < ActiveRecord::Migration[5.2]
  def change
    create_table :blands do |t|
      t.string :bland,    index: true
      t.timestamps
    end
  end
end
