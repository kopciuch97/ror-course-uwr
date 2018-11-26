# frozen_string_literal: true

FactoryBot.define do
  factory :ticket do
    association :event, factory: :event
    association :owner, factory: :user
    place { 5 }
    price { 10.0 }
  end
end
