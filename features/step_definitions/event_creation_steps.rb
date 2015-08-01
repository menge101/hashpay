Given /^a default event$/ do
  @event = FactoryGirl.create(:event)
end

Given /^an event with cost of '(.+)'$/ do |cost|
  @event = FactoryGirl.create(:event, cost: cost)
end

Given /^an event with a date (.+) days in the past$/ do |day_count|
  @event = FactoryGirl.create(:event, date: (DateTime.now - day_count.to_i.days))
end