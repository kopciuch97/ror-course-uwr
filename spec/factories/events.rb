# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Fallout.character }
    content { Faker::Fallout.quote }
    city { Faker::Fallout.location }
    after :create do |event|
      create_list :ticket, 3, event: event
    end
  end

  factory :event_with_sold_tickets, class: Event do
    name { Faker::Fallout.character }
    content { Faker::Fallout.quote }
    city { Faker::Fallout.location }
    after :create do |event|
      create_list :ticket_sold, 3, event: event
    end
  end
end
