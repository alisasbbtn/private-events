class PagesController < ApplicationController
  def home
    @latest_events = Event.limit(3)
    @events_today = Event.today.limit(3)
  end

  def about; end
end
