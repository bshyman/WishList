class GiftsController < ApplicationController
  layout 'sidenav'

  load_and_authorize_resource
  def index
  end
  
  def new
  end

  def create
    @gift.assign_attributes(gift_params)
    @gift.update(event_id: current_event.id, giftee_id: current_user_event.id)
    redirect_to wishes_user_path(current_user), notice: 'Saved'
  end

  def user
    byebug
    # what am i used for
    @user = User.find(gift_params[:user_id])
    ue = UserEvent.find_by(user_id: @user.id, event_id: @event.id)
    @gifts = @event.gifts.where(giftee_id: ue.id)
    render 'gifts'
  end

  def show
    render partial: 'gifts/gift', locals: {gift: @gift}
  end

  private

  def gift_params
    params.require(:gift).permit(:id, :event_id, :user_id, :name, :url)
  end
end
