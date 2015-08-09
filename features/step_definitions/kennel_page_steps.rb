Then /^I expect there to be no upcoming events$/ do
  expect(@kennelPage.empty_event_listing.text).to eq('There are no upcoming events')
end

Then /^the kennel page first event navigational button text reads '(.*?)'$/ do |text|
  expect(@kennelPage.events[0].nav_button.text).to eq(text)
end