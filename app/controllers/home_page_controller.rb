# frozen_string_literal: true

class HomePageController < ApplicationController
  def index
    @events_promoted = Event.show_events(:promoted)
    @events = Event.show_events(:show).limit(5)
  end
end
