class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @upcoming_events = Event.upcoming
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.events.build(event_params)
    current_user.attendings.create(attended_event: @event)
    if @event.save
      flash[:success] = 'Event created!'
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :date, :location)
  end
end
