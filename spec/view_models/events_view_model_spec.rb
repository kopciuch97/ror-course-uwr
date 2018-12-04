# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsViewModel do
  let(:events) { FactoryBot.create_list(:event, 5) }
  describe '#events' do
    it do
      described_class.new.events(events[2].name).each do |event|
        expect(event.name).to eq(events[2].name)
      end
    end
  end
end
