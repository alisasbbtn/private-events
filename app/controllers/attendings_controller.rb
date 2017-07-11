class AttendingsController < ApplicationController
  def create
    event = Event.find(params[:attending][:attended_event_id])
    current_user.attendings.create(attended_event: event)
    flash[:success] = "You are now attending event \"#{event.title}\"."
    redirect_to event
  end

  def destroy
    event = Event.find(params[:attending][:attended_event_id])
    attending = Attending.find_by(attended_event_id: params[:attending][:attended_event_id], attendee_id: current_user.id)
    current_user.attendings.delete(attending)
    flash[:danger] = "You are not attending event \"#{event.title}\" anymore."
    redirect_to event
  end
end
