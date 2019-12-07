class GiftsController < ApplicationController
  layout 'sidenav'

  load_and_authorize_resource
  def index
  
  end
  
  def new
  
  
  end
  
  def user
    @user_events = UserEvent.where(user_id: current_user.id)
    byebug
    @gifts = Gift.all
    render 'gifts/gifts_for_user'
  end
  
  def show
    render partial: 'gifts/gift', locals: {gift: @gift}
  end
  
  private
  def gift_params
    params.require(:gift).permit(:id, :event_id, :user_id, :name, :url)
  end
end
