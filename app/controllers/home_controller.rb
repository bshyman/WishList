class HomeController < ApplicationController
  layout '_base'
  
  def landing
    redirect_to select_event_users_path if user_signed_in?
  end
end
