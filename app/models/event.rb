# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :tickets

  has_one_attached :image

  enum status: [:show, :hide, :promoted]

  def Event.show_events(status)
    Event.where(status: status)
  end
end
