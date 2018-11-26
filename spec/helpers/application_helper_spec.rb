# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  before do
    flash[:notice] = 'notice'
    flash[:smth_else] = 'smth_else'
  end
  describe '#flash_collect_alerts' do
    it do
      expect(flash_collect_alerts(flash)).to have_key('notice')
    end
    it do
      expect(flash_collect_alerts(flash).length).to be(1)
    end
  end
end
