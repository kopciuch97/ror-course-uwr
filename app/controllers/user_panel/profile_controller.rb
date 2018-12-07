# frozen_string_literal: true

module UserPanel
  class ProfileController < ApplicationController
    before_action :authenticate_user!

    def index
      @own_tickets = Ticket.where(owner_id: current_user)
      @bought_tickets = Ticket.where(bought_by: current_user)
    end
  end
end
