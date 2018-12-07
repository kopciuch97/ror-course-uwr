# frozen_string_literal: true

class BuyTicket < ActiveInteraction::Base
  object :user
  object :ticket

  validate :can_buy

  def execute
    ticket.buy(user)
    errors.add(:base, ticket.errors.full_messages) unless ticket.save
  end

  private

  def can_buy
    errors.add(:base, "You can't buy your own ticket.") if ticket.owner == user
    errors.add(:base, 'Ticket has already been sold.') unless ticket.bought_by.nil?
  end
end
