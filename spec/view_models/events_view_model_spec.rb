# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsViewModel do
  let(:events) { FactoryBot.create_list(:event, 5) }
  describe '#events' do
    it do
      expect(described_class.new.events(events[2].name).length).to eq(1)
    end
  end
end
