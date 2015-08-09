When /^I navigate to the event page$/ do
  @event = EventPage.new
  @event.load
end

When /I navigate to the kennel page$/ do
  @kennelPage = KennelPage.new
  abrv = @kennel ? @kennel.abbreviation : 'P3H3'
  @kennelPage.load(abbreviation: abrv)
end

Then /^the 'event' page is displayed$/ do
  expect(EventPage.new).to be_displayed
end

Then /^the 'whosecoming' page is displayed$/ do
  expect(ViewPage.new).to be_displayed
end