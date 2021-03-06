# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BuyTicket do
  let(:user) { create :user }
  let(:ticket) { create :ticket }
  let(:outcome) { BuyTicket.run(ticket: ticket, user: user) }

  describe 'Buy ticket' do
    context "ticket wasn't sold and user isn't owner" do
      it do
        expect(outcome).to be_valid
        expect(ticket.bought_by).to eq(user)
      end
    end

    context 'ticket has been sold' do
      let(:ticket) { create :ticket, :sold }

      it do
        expect(outcome).to_not be_valid
      end

      it do
        expect(outcome.errors.full_messages.join('. ')).to match(/already been sold/)
      end
    end

    context 'user buy his own ticket' do
      let(:user) { ticket.owner }

      it do
        expect(outcome).to_not be_valid
      end

      it do
        expect(outcome.errors.full_messages.join('. ')).to match(/your own ticket/)
      end
    end
  end
end
