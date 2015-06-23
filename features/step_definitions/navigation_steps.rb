When /^I navigate to the event page$/ do
  @event = EventPage.new
  @event.load
end