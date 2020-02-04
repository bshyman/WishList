class SessionsController < ApplicationController
  #skip_before_ :google_oauth, :create
  
  def google_oauth
    # Get access tokens from the google server
    access_token = request.env['omniauth.auth']
    user         = User.from_omniauth(access_token)
    # Access_token is used to authenticate request made from the rails application to the google server
    user.google_token = access_token.credentials.token
    # Refresh_token to request new access_token
    # Note: Refresh_token is only sent once during the first request
    refresh_token = access_token.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    session[:user_id] = user.id
    if user.last_event_id.present?
      session[:event_id] = user.last_event_id
      redirect_to event_users_path(user, event_id: user.last_event_id), notice: 'Logged in!'
    else
      event_ids = UserEvent.where(user_id: user.id).pluck(:event_id).uniq
      if event_ids.size == 1
        event_id = event_ids.first
        session[:event_id] = event_id
        user.update(last_event_id: event_id)
        return redirect_to event_users_path(event_id: event_id),notice: 'logged in.'
      end
      redirect_to select_event_users_path
    end
  end
  
  def create
    google_oauth
  end
  
  def destroy
    session[:user_id] = nil
    session[:event_id]
    @current_ability = nil
    @current_user = nil
    @current_event = nil
    redirect_to home_landing_path, notice: 'Signed out'
  end
end
