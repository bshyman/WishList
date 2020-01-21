class RenameUserEventIdToGifteeId < ActiveRecord::Migration[5.2]
  def change
    rename_column :gifts, :user_event_id, :giftee_id
  end
end
