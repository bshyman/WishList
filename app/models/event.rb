class Event < ApplicationRecord
  has_many :user_events, class_name: 'UserEvent'
  has_many :users, through: :user_events
end
