# frozen_string_literal: true

class HomePageController < ApplicationController
  def index
    @events_promoted = Event.promoted
    @events = Event.visible.limit(5)
  end
end
