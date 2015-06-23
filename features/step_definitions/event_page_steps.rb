Then /^I see the event name$/ do
  expect(@event.event_info).to have_eventName
end

Then /^I see the event date$/ do
  expect(@event.event_info).to have_eventDate
end

Then /^I see the event cost$/ do
    expect(@event.event_info).to have_eventCost
end

Then /^I see the registration form$/ do
  expect(@event.has_registration?).to be_truthy
  %w(nameLabel name hashLabel hashName kennelLabel kennel).each do |field|
    expect(@event.registration).to "have_#{field}"
  end
end