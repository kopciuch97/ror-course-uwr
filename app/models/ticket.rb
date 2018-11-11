# frozen_string_literal: true

class Ticket < ApplicationRecord
  belongs_to :event
  belongs_to :user
  validates :place, length: { in: 1..20 }
  validates :price, numericality: {greater_than: 0}
end
