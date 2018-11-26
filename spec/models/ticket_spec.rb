# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ticket, type: :model do
  it 'has a valid Factory' do
    expect(build(:ticket)).to be_valid
  end
end
