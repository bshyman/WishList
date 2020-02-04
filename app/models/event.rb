class Event < ApplicationRecord
  has_many :user_events, class_name: 'UserEvent'
  has_many :users, through: :user_events
  has_many :gifts

  validates_uniqueness_of :join_code
  validates_length_of :join_code, within: 3..32
  
  enum status: {
      draft:  0,
      active: 1
  }
end
