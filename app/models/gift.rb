class Gift < ApplicationRecord
  def receiver
    receiver_ue = UserEvent.find(user_event_id)
    User.find(receiver_ue.user_id)
  end
end
