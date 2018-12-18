# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!

  def new
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
    outcome = BuyTicket.run(
      ticket: Ticket.find(params[:id]),
      user: current_user
    )

    if outcome.valid?
      flash[:notice] = 'You have bought ticket.'
    else
      flash[:alert] = outcome.errors.full_messages.join('. ')
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

  def destroy
    @ticket = current_user.issued_tickets.find(params[:id])
    if @ticket.bought_by
      flash[:alert] = 'Ticket has already been sold.'
    else
      @ticket.destroy
      flash[:notice] = 'Your ticket has been deleted.'
    end

    redirect_to user_panel_root_url
  end
end
