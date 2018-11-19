# frozen_string_literal: true

module UserPanel
  class ProfileController < ApplicationController
    before_action :authenticate_user!

    def index
      @tickets = Ticket.where(owner_id: current_user)
    end
  end
end
