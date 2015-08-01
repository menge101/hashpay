Then /^I expect there to be no upcoming events$/ do
  expect(@kennel.empty_event_listing.text).to eq('There are no upcoming events')
end