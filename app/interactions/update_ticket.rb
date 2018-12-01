# frozen_string_literal: true

class UpdateTicket < ActiveInteraction::Base
  object :ticket
  hash :ticket_parameters do
    string :place
    string :event_id
    string :price
  end

  validate :can_edit

  def execute
    errors.add(:base, 'Your ticket has not been edited.') unless ticket.update(ticket_parameters)
    ticket
  end

  private

  def can_edit
    errors.add(:base, 'Ticket has already been sold, so it can not be modified.') unless ticket.bought_by.nil?
  end
end
