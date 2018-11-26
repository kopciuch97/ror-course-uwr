# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTicket do
  let(:event) { FactoryBot.create :event }
  let(:ticket) { event.tickets[0] }
  let(:parameters) { { place: 'A1', event_id: event.id.to_s, price: '10' } }
  let(:outcome) { UpdateTicket.run(ticket: ticket, ticket_parameters: parameters) }

  describe 'Update ticket' do
    context 'edit ticket' do
      it 'is valid' do
        expect(outcome).to be_valid
        expect(outcome.result.place).to eql parameters[:place]
        expect(outcome.result.price).to eql parameters[:price].to_f
        expect(outcome.result.event_id).to eql parameters[:event_id].to_i
      end
    end

    context 'edit sold ticket' do
      let(:event_with_sold_tickets) { FactoryBot.create :event_with_sold_tickets }
      let(:ticket) { event_with_sold_tickets.tickets[0] }

      it 'is not valid' do
        expect(outcome).to_not be_valid
        expect(outcome.errors).to have_key :base
        expect(outcome.errors.full_messages.join('. ')).to match(/already been sold/)
      end
    end
  end
end
