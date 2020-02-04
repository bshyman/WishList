class UserEvent < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy
  belongs_to :permission
  attr_accessor :join_code
  validates_presence_of :user_id, :event_id, :permission_id
  
  def superuser?
    permission == Permission::SUPERUSER
  end
  
  def admin?
    permission == Permission::ADMIN
  end
  
  def member?
    permission == Permission::MEMBER
  end
  
  def event_name
    event&.name || 'UEwithNOe'
  end
end
