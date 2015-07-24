When /^I navigate to the event page$/ do
  @event = EventPage.new
  @event.load
end

Then /^the '(.+)' page is displayed$/ do |page|
  page_map = { whosecoming: ViewPage.new, event: EventPage.new }
  expect(page_map[page.to_sym]).to be_displayed
end