When /^I navigate to the event page$/ do
  @event = EventPage.new
  @event.load
end

Then /^the 'whosecoming' page is displayed$/ do
  expect(ViewPage.new).to be_displayed
end