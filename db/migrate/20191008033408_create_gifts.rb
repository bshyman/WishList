class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.references :user_event
      t.integer :gifter_id
      t.string :name
      t.decimal :price, precision: 9, scale: 2
      t.string :url
      t.integer :priority, default: 0
      t.string :color
      t.string :size
      t.text :notes
      t.timestamps
    end
  end
end
