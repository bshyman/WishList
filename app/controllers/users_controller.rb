# frozen_string_literal: true
class UsersController < ApplicationController
  load_and_authorize_resource except: %i[new create]
  prepend_view_path(File.join(Rails.root, 'app/views/users/'))
  layout 'application'
  # layout "scaffold"
  layout 'sidenav'

  before_action :set_user, only: %i[show edit update destroy]
  before_action :set_user_events

  # GET /users
  def index; end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  def dashboard∑
  end
  
   def select_event
     @events = current_user.events
   end

  private

  def user_params
    params.require(:user).permit
  end

  def set_user_events
    @user_events = current_user.user_events
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end
  

  def billing; end

  def plan; end

  def profile; end

  def support; end

  def notifications; end

end
