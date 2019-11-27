class HomeController < ApplicationController
  layout '_base'
  skip_before_action :authenticate_user!
  def landing
    redirect_to user_events_path(current_user.id) if user_signed_in?
  end
end
