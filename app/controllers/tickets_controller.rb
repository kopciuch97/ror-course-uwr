class TicketsController < ApplicationController

  before_action :authenticate_user!
  def index
    @events = Event.all
    @ticket = Ticket.new
  end

  before_action :authenticate_user!
  def create
    @ticket = Ticket.new(
                        params.require(:ticket).permit(:place, :event_id, :price).merge(owner_id: current_user.id)
    )
    flash[:notice] = if @ticket.save
                       'Bilet zostal wystawiony'
                     else
                       @ticket.errors.full_messages.join('. ')
                     end

    redirect_to root_path
  end

  before_action :authenticate_user!
  def buy
    ticket = Ticket.find(params[:ticket_id])
    ticket.buy_ticket(ticket.id, current_user.id)

    flash[:notice] = if ticket.save
                       'Bilet zostal kupiony'
                     else
                       ticket.errors.full_messages.join('. ')
                     end
    redirect_to root_path
  end

  def update

  end
end