class AddPermissionIdToUserEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_events, :permission, foriegn_key: true
  end
end
