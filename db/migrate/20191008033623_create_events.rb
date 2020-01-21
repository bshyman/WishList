class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.boolean :private_event, default: true
      t.string :join_code
      
      t.timestamps
    end
  end
end
