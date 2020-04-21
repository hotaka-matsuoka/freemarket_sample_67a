class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string     :image_url,   null: false
      t.references :exhibition,  foreing_key: true
      t.timestamps
    end
  end
end
