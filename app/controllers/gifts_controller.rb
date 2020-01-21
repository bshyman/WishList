class GiftsController < ApplicationController
  layout 'sidenav'

  load_and_authorize_resource
  def index
  end
  
  def new
  end
  
  def user
    @user  = User.find(gift_params[:user_id])
    @gifts = @event.gifts.where(giftee_id: @user.id)
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
