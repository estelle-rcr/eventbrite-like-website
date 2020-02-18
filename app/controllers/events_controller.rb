class EventsController < ApplicationController
  before_action :authenticate_user, only: [:new, :create]
  before_action :authenticate_admin, only: [:edit, :update, :destroy]

  def show
    @event = Event.find(params[:id])
    @attendances = Attendance.where(event_id: @event)
  end

  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new('start_date' => params[:start_date], 'duration' => params[:duration], 'title' => params[:title], 'description' => params[:description], 'price' => params[:price], 'location' => params[:location])
    @event.admin_id = current_user.id
    if @event.save 
      flash[:success] = "Your event has been created!"
    redirect_to root_path
    else
    render 'new'
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
      if @event.update(start_date: params[:start_date], duration: params[:duration], title: params[:title], description: params[:description], price: params[:price], location: params[:location])
        flash[:success] = "The event has been modified"
        redirect_to @event
      else
        render :edit
      end
  end

  def destroy
    @event = Event.find(params[:id])
    if @event.destroy
      flash[:success] = "The event has been deleted"
      redirect_to root_path
    else 
      render 'show'
    end
  end

  private 
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def authenticate_admin
    @event = Event.find(params[:id])
    unless @event.admin == current_user
      flash[:danger] = "Sorry, it's not your event. You can't edit or delete it."
      redirect_to @event
    end
  end

end