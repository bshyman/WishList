class EventsController < ApplicationController
  load_and_authorize_resource
  layout 'application'
  # layout "scaffold"
  layout 'sidenav'
  
  def index
    @body_class = 'show-sidebar'
  end
  
  def new
    @event = Event.new
  end
  
  def show
    @body_class = 'show-sidebar'
    @users = @event.users
  end
  
  def create
    if @event.save
      UserEvent.create(user_id: current_user.id, event_id: @event.id, permission_id: 2)
      redirect_to user_events_path, notice: "Event created!"
    else
      render 'new'
    end
  end
  
  def users
    @users = @event.users
  end
  
 def set_selected_event
   session[:event_id] = params[:id]
   if current_event.nil?
     redirect_to select_event_users_path
   else
     redirect_to event_users_path(current_event), notice: 'Event ' + @event.name
   end
  
 end
  
  private
  def event_params
    params.require(:event).permit(:name, :join_code)
  end
  
end
