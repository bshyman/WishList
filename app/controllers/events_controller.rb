class EventsController < ApplicationController
  layout 'application'
  # layout "scaffold"
  layout 'sidenav'
  def index
  
  end
  
  def new
    @event = Event.new
  end
  def create
  end
  
end
