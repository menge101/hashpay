require 'rails_helper'
require_relative 'support/fakeweb'

RSpec.describe Event do
  include Rack::Test::Methods

  before :each do
    register_geocoder
  end

  context 'when creating an event' do
    let(:event) { FactoryGirl.create(:event, location: '600 Grant street, Pittsburgh, PA 15219') }
    it 'automagically has latitude and longitude' do
      expect(event.latitude).to eq 40.441291
      expect(event.longitude).to eq -79.9945702
    end

    it 'automagically has city, state, and postal code' do
      expect(event.city).to eq 'Pittsburgh'
      expect(event.state).to eq 'Pennsylvania'
      expect(event.state_code).to eq 'PA'
      expect(event.postal_code).to eq '15219'
    end

    it 'automagically has country and country code' do
      expect(event.country).to eq 'United States'
      expect(event.country_code).to eq 'US'
    end

    it 'automagically has a web_formatted_address' do
      expect(event.web_formatted_address).to eq '600 Grant St<br>Pittsburgh  15219<br>United States of America'
    end
  end

  describe '#calculate_marker' do

    context 'with two events' do
      it 'returns the first and last marker' do
        event1 = FactoryGirl.create(:event)
        event2 = FactoryGirl.create(:event)
        results = [event1.calculate_marker, event2.calculate_marker]
        expect(results).to include('onon_marker_0.png')
        expect(results).to include('onon_marker_210.png')
      end
    end
    context 'with one event' do
      let(:event) { FactoryGirl.create(:event) }
      it 'returns the first marker' do
        expect(event.calculate_marker).to eq('onon_marker_0.png')
      end
    end

    context 'with three events' do
      it 'returns the first, last, and middle marker' do
        event1 = FactoryGirl.create(:event)
        event2 = FactoryGirl.create(:event)
        event3 = FactoryGirl.create(:event)
        results = [event1.calculate_marker, event2.calculate_marker, event3.calculate_marker]
        expect(results).to include('onon_marker_0.png')
        expect(results).to include('onon_marker_105.png')
        expect(results).to include('onon_marker_210.png')
      end
    end

    context 'with three events asymetrically distributed' do
    it 'returns the first, last, and middle marker' do
      event1 = FactoryGirl.create(:event, date: DateTime.now + 100.days)
      event2 = FactoryGirl.create(:event, date: DateTime.now + 101.days)
      event3 = FactoryGirl.create(:event, date: DateTime.now + 110.days)
      results = [event1.calculate_marker, event2.calculate_marker, event3.calculate_marker]
      expect(results).to include('onon_marker_0.png')
      expect(results).to include('onon_marker_21.png')
      expect(results).to include('onon_marker_210.png')
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


