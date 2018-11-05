# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :owner, :class_name => 'User'
  belongs_to :bought_by, :class_name => 'User', optional: true
  validates :place, length: { in: 1..20 }
  validates :price, numericality: {greater_than: 0}

  def buy_ticket(ticket_id, user_id)
    ticket = Ticket.find(ticket_id)
    ticket.bought_by = user_id
  end

end
