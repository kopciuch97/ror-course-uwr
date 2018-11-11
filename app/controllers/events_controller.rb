# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = EventsViewModel.new.events(params[:name])
  end

  def show
    @view = EventsViewModel.new.show_event(params[:id])
  end
end
