# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  describe 'GET #index' do
    subject { get :index }

    it do
      expect(subject.status).to eq(200)
    end

    it do
      subject
      expect(assigns(:events)).to eq([])
      expect(assigns(:events_promoted)).to eq([])
    end

    context 'with one normal event' do
      let!(:event) { create :event }

      it do
        subject
        expect(assigns(:events).length).to eq(1)
        expect(assigns(:events)).to eq([event])
        expect(assigns(:events_promoted)).to eq([])
      end
    end

    context 'with a few normal events' do
      let!(:events) { create_list :event, 6}

      it do
        subject
        expect(assigns(:events).length).to eq(6)
        expect(assigns(:events)).to eq(events)
        expect(assigns(:events_promoted)).to eq([])
      end
    end

    context 'with a few normal events and a few promoted events' do
      let!(:event) { create :event }
      let!(:event1) { create :event }
      let!(:event2) { create :event, :promoted }
      let!(:event3) { create :event }
      let!(:event4) { create :event, :promoted }

      it do
        subject
        expect(assigns(:events).length).to eq(3)
        expect(assigns(:events)).to eq([event, event1, event3])
        expect(assigns(:events_promoted).length).to eq(2)
        expect(assigns(:events_promoted)).to eq([event2, event4])
      end
    end
  end

  describe 'GET #show' do
    let(:event) { create :event }

    subject { get :show, params: { id: event.id } }

    it do
      expect(subject.status).to eq(200)
    end

    it do
      subject
      expect(assigns(:event)).to eq(event)
    end

    it 'event without sold tickets' do
      subject
      expect(assigns(:tickets)).to eq(event.tickets.to_sell)
    end

    context 'event with sold tickets' do
      let(:event) { create :event, :with_sold_tickets }

      it do
        subject
        expect(assigns(:tickets)).to eq(event.tickets.to_sell)
      end
    end
  end
end
