class HomeController < ApplicationController
  layout '_base'
  #skip_before_action :current_event
  
  def landing
    redirect_to select_event_users_path if user_signed_in?
  end
end
