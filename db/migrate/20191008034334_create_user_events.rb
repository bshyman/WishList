class CreateUserEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :user_events do |t|
        t.references :event
        t.references :user
        
      t.timestamps
    end
  end
end
