class Event < ApplicationRecord
  has_many :user_events, class_name: 'UserEvent'
  has_many :users, through: :user_events
  
  enum status: {
      draft:  0,
      active: 1
  }
end
