class AddColsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :name, :string
    add_column :events, :private_event, :boolean, default: true
    add_column :events, :join_code, :string
  end
end
