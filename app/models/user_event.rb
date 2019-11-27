class UserEvent < ApplicationRecord
  belongs_to :user, dependent: :destroy
  belongs_to :event, dependent: :destroy
  belongs_to :permission
  has_many :gifts
  
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
