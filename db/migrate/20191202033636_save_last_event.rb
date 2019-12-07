class SaveLastEvent < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :last_event_id, :integer
  end
end
