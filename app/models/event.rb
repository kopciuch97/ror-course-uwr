# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :tickets

  has_one_attached :image

  enum status: %i[visible hidden promoted]

  scope :promoted, -> { where(status: :promoted) }
  scope :hidden, -> { where(status: :hidden) }
  scope :visible, -> { where(status: :visible) }
end
