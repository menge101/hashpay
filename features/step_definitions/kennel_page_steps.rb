Then /^I expect there to be no upcoming events$/ do
  expect(@page.empty_event_listing.text).to eq('There are no upcoming events')
end

Then /^the kennel page first event navigational button text reads '(.*?)'$/ do |text|
  expect(@page.events[0].nav_button.text).to eq(text)
end

Then /^facebook link is (not )?present on the kennel page$/ do |cntrl|
  expect(@page.common_footer.has_facebook_link?).to (cntrl ? be_falsey : be_truthy)
end