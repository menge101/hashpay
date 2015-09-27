require 'rails_helper'
require_relative 'support/fakeweb'

RSpec.describe Event do
  include Rack::Test::Methods

  before(:all) do
    register_geocoder
  end

  context 'when creating an event' do
    it 'automagically has latitude and longitude' do
      @event = FactoryGirl.create(:event)
      expect(@event.latitude).to be
      expect(@event.longitude).to be
    end
  end

  describe '#calculate_marker' do
    context 'with two events' do
      it 'returns the first and last marker' do
        event1 = FactoryGirl.create(:event)
        event2 = FactoryGirl.create(:event)
        results = [event1.calculate_marker, event2.calculate_marker]
        expect(results).to include('onon_marker_0.png')
        expect(results).to include('onon_marker_211.png')
      end
    end
    context 'with one event' do
      it 'returns the first marker' do
        event = FactoryGirl.create(:event)
        expect(event.calculate_marker).to eq('onon_marker_0.png')
      end
    end
    context 'with 211 events' do
      it 'returns every marker' do
        events = Array.new
        211.times do
          events << FactoryGirl.create(:event)
        end
        events.map! { |x| x.calculate_marker }
        211.times do |i|
          expect(events).to include("onon_marker_#{i}.png")
        end
      end
    end
  end
end


