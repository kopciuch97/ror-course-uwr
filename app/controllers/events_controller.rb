# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = EventsViewModel.new.events(params[:name])
    @events_promoted = Event.promoted
  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets.to_sell
  end
end
