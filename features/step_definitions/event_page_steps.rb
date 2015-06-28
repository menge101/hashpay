Then /^I see all expected elements on the page$/ do
  expect(@event).to be_all_there
end

Then /^the event name is '(.+)'$/ do |name|
  expect(@event.event_info.event_name.text).to eq(name)
end

Then /^the event description is '(.+)'$/ do |description|
  expect(@event.event_info.event_description.text).to eq(description)
end

Then /^the event location is '(.+)'$/ do |loc|
  expect(@event.event_info.event_location.text).to eq(loc)
end

Then /^the event cost is '(.+)'$/ do |cost|
  expect(@event.event_info.event_cost.text).to eq(cost)
end

Then /^the event page is using https$/ do
  expect(@event.secure?).to be_truthy
end