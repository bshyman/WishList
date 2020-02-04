class UserEventsController < ApplicationController
  load_and_authorize_resource
  layout 'sidenav'
  
  def index
  end

  def new
  end

  def create
    target = Event.find_by_join_code(user_event_params[:join_code])
    if target
      UserEvent.create(user_id: current_user.id, event_id: target.id, permission_id: Permission::MEMBER.id)
      session[:event_id] = target.id
      redirect_to event_users_path(target), notice: 'Joined!'
    else
      respond_to do |format|
        format.json do
          render json: {success: false, message: 'No event found with that code'}
        end
        format.html do
          redirect_to select_event_users_path
          flash[:error] = 'No event found with that code'
        end
      end
    end
  end
  
  def show
    @user_events = UserEvent.where(user_id: current_user.id)
    @users       = @user_event.event.users
  end
  
  def giftee
    ue = UserEvent.find_by(event_id: @user_event.event_id)
    @gifts = current_event.gifts.where(giftee_id: @user_event.id)
    render 'gifts'
  end

  def user_event_params
    params.require(:user_event).permit(:join_code)
  end
end
