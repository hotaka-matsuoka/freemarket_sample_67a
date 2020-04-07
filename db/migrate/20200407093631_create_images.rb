class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string     :image1
      t.string     :image2
      t.string     :image3
      t.string     :image4
      t.string     :image5
      t.string     :image6
      t.string     :image7
      t.string     :image8
      t.string     :image9
      t.string     :image10
      t.references :exbition,  foreing_key: true
      t.timestamps
    end
  end
end
