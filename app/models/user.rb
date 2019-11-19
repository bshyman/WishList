class User < ApplicationRecord
  has_many :user_events
  has_many :events, through: :user_events
  
  
  def self.from_omniauth(auth)
    user            = find_or_create_by(email: auth.info.email)
    user.provider   = auth.provider
    user.uid        = auth.uid
    user.first_name = auth.info.first_name
    user.last_name  = auth.info.last_name
    user.email      = auth.info.email
    user.save!
    user
  end
end
