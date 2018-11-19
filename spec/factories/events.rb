# frozen_string_literal: true

FactoryBot.define do
  factory :event do
    name { Faker::Fallout.character }
    content { Faker::Fallout.quote }
    city { Faker::Fallout.location }
  end
end
