class Gift < ApplicationRecord
  def receiver
    receiver_ue = UserEvent.find(giftee_event_id)
    User.find(receiver_ue.user_id)
  end
end
