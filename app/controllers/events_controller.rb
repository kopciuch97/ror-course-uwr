class EventsController < ApplicationController
  def index()
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @tickets = Ticket.new(event: @event)
  end
end
