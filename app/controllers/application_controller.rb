class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  # load_and_authorize_resource except: :sessions
  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?
  helper_method :current_event
  helper_method :current_user_event
  #before_action :current_event
  #before_action :current_event

  # before_action :authenticate_user!
  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json {head :forbidden, content_type: 'text/html'}
      format.html {redirect_to root_path, notice: exception.message}
      format.js {head :forbidden, content_type: 'text/html'}
    end
  end

  def current_ability
    authenticate_user!
    user_event       = params[:event_id] ? UserEvent.find_by(event_id: params[:event_id], user_id: current_user.id) : UserEvent.new(user_id: current_user.id)
    @current_ability ||= Ability.new(user_event)
  end

  private

  def current_event
    @event ||= Event.find_by(id: session[:event_id])
  end
  
  def current_user
    begin
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    rescue StandardError => e
      redirect_to home_landing_path
    end
  end



    def current_user_event
      @current_user_event ||= UserEvent.find_by(event_id: current_event.id, user_id: current_user.id)
    end

  
  def user_signed_in?
    current_user.present?
  end
  
  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_url, alert: "Access denied." unless current_user == @user
  end

def authenticate_user!
  unless current_user
    redirect_to root_path, alert: 'You need to sign in for access to this page.'
  end
end

end
