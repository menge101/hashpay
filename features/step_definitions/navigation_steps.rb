When /^I navigate to the event page$/ do
  @event = EventPage.new
  @event.load
end

When /I navigate to the kennel page$/ do
  @kennel = KennelPage.new
  @kennel.load
end

Then /^the 'event' page is displayed$/ do
  expect(EventPage.new).to be_displayed
end

Then /^the 'whosecoming' page is displayed$/ do
  expect(ViewPage.new).to be_displayed
end