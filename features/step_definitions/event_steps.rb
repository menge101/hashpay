Given /^a default event$/ do
  @event = FactoryGirl.create(:event)
end

Given /^an event with cost of '(.+)'$/ do |cost|
  @event = FactoryGirl.create(:event, cost: cost)
end