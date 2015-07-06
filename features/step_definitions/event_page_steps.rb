When /^I click the '(.+)' button$/ do |button|
  button_map = { 'pay with stripe' => :stripe_button, 'add' => :add_button}
  @event.registration.send(button_map[button]).click
end


Then /^I see all expected elements on the page$/ do
  expect(@event).to be_all_there #does not work due to stripe iframe being invisible until clicked
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

Then /^the stripe payment overlay is (not )?displayed$/ do |negation|
  @event.wait_for_stripe_iframe
  expect(@event.has_stripe_iframe?).to (negation.blank? ? be_truthy : be_falsey)
end

And /^I set the (first|last) name to '(.+)'$/ do |place, name|
  @event.registration.hash_names.send(place.to_sym).set(name)
end

And /^I set the (first|last) kennel to '(.+)'$/ do |place, kennel|
  @event.registration.kennels.send(place.to_sym).set(kennel)
end

And /^I add an attendee with name '(.+)' and kennel '(.+)'$/ do |name, kennel|
  step "I click the 'add' button"
  step "I set the last name to '#{name}'"
  step "I set the last kennel to '#{kennel}'"
end

And /^I set name to '(.+)'$/ do |name|
  step "I set the first name to '#{name}'"
end

And /^I set kennel to '(.+)'$/ do |kennel|
  step "I set the first kennel to '#{kennel}'"
end
