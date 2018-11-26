# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!

  def index
    @events = Event.all
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(params.require(:ticket).permit(:place, :event_id, :price).merge(owner_id: current_user.id))
    flash[:notice] = if @ticket.save
                       'Bilet zostal wystawiony'
                     else
                       @ticket.errors.full_messages.join('. ')
                     end

    redirect_to root_path
  end

  def buy
    ticket = Ticket.find(params[:ticket_id])
    ticket.buy_ticket(ticket.id, current_user.id)

    flash[:notice] = if @ticket.save
                       'Bilet zostal kupiony'
                     else
                       @ticket.errors.full_messages.join('. ')
                     end
    redirect_to root_path
  end

  def edit
    @ticket = current_user.issued_tickets.find(params[:id])
    @events = Event.all
  end

  def update
    @ticket = current_user.issued_tickets.find(params[:id])
    parameters = params.require(:ticket).permit(:place, :event_id, :price)

    outcome = UpdateTicket.run(ticket: @ticket, ticket_parameters: parameters.to_h)
    if outcome.valid?
      flash[:notice] = 'Your ticket has been edited.'
    else
      flash[:alert] = outcome.errors.full_messages.join('. ')
    end

    redirect_to user_panel_root_url
  end
end
