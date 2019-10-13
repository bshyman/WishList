class CreateGifts < ActiveRecord::Migration[5.2]
  def change
    create_table :gifts do |t|
      t.references :user_event
      t.integer :recipient_id
      t.timestamps
    end
  end
end
