# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let!(:user) { FactoryBot.create :user }
  let!(:event) { FactoryBot.create :event }

  before do
    sign_in user
  end

  describe 'POST create' do
    before do
      params = { params: {
        ticket: {
          place: 'auu',
          event_id: event.id,
          price: 10.0
        }
      } }
      post :create, params
    end
    it do
      expect(flash[:notice]).to match(/wystawiony/)
    end
    it do
      expect(response).to redirect_to(root_path)
    end
  end

  describe 'POST #buy' do
    let(:ticket) { event.tickets[0] }
    subject { post :buy, params: { id: ticket.id } }

    before do
      allow(BuyTicket).to receive(:run).and_return(outcome)
    end

    context 'when user can buy ticket' do
      let(:outcome) { instance_double(BuyTicket, valid?: true) }

      it do
        subject
        expect(controller.flash[:notice]).to eq('You have bought ticket.')
      end

      it do
        expect(subject).to redirect_to(root_path)
      end
    end

    context "when user can't buy ticket" do
      let(:outcome) { instance_double(BuyTicket, valid?: false, errors: errors) }
      let(:errors) { Struct.new(:full_messages).new(['Ticket has already been sold.']) }

      it do
        subject
        expect(controller.flash[:alert]).to eq('Ticket has already been sold.')
      end

      it do
        expect(subject).to redirect_to(root_path)
      end
    end
  end
  describe 'PUT #update' do
    let(:ticket) { create :ticket, owner: user }
    let(:params) do
      {
        id: ticket.id,
        ticket: {
          place: 'auu',
          event_id: event.id,
          price: 1.0
        }
      }
    end

    it 'located the requested ticket' do
      put :update, params: params
      expect(assigns(:ticket)).to eq(ticket)
    end

    it 'changes ticket attributes' do
      put :update, params: params
      expect(controller.flash[:notice]).to match(/ticket has been edited/)
      ticket.reload
      expect(ticket.place).to eq('auu')
      expect(ticket.event).to eq(event)
      expect(ticket.price).to eq(1.0)
    end

    it 'doesn\'t change attributes' do
      put :update, params: {
        id: ticket.id,
        ticket: { place: 'x' }
      }
      expect(controller.flash[:alert]).to_not be(nil)
      ticket.reload
      expect(ticket.place).to eq('5')
    end

    it 'redirects to user panel' do
      put :update, params: {
        id: ticket.id,
        ticket: params
      }
      expect(response).to redirect_to(user_panel_root_url)
    end
  end
end
