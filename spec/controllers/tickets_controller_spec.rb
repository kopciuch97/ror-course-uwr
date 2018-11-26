# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TicketsController, type: :controller do
  let!(:user) { FactoryBot.create :user }
  let!(:event) { FactoryBot.create :event }
  before do
    allow(request.env['warden']).to receive(:authenticate!).and_return(user)
    allow(controller).to receive(:current_user).and_return(user)
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
end
