class UserEventsController < ApplicationController
  load_and_authorize_resource
  layout 'sidenav'
  
  def index
  end
  
  def show
    @user_events = UserEvent.where(user_id: current_user.id)
    @users       = @user_event.event.users
  end
  
  def user_gifts
    #@user_event = UserEvent.find(params[:id])
    @name = @user_event.user.name
    @gifts = @user_event.gifts
    render 'user_events/gifts'
  end
end
