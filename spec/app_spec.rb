require 'rails_helper'

RSpec.describe Event do
  include Rack::Test::Methods

  context 'when creating an event' do
    before(:all) do
      @event = FactoryGirl.create(:event)
    end

    it 'automagically has latitude and longitude' do
      expect(@event.latitude).to be
      expect(@event.longitude).to be
    end
  end
end


