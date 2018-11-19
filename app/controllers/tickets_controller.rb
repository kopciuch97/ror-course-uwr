# frozen_string_literal: true

class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :can_edit, only: %i[edit update]
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
    @events = Event.all
  end

  def update
    parameters = params.require(:ticket).permit(:place, :event_id, :price)
    if @ticket.update(parameters)
      flash[:notice] = 'Your ticket has been edited.'
    else
      flash[:alert] = 'Your ticket has not been edited.'
    end
    redirect_to user_panel_root_url
  end

  private

  def can_edit
    @ticket = Ticket.find(params[:id])
    if @ticket.owner_id != current_user.id
      flash[:alert] = 'You can edit only your own ticket.'
      redirect_to root_path
    end
    unless @ticket.bought_by.nil?
      flash[:alert] = 'Ticket has already been sold, so it can not be modified.'
      redirect_to root_path
    end
  end
end
