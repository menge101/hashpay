When /^I click on the '(?:Event Registration|Registration List)' button$/ do
  @page.event_info.nav_button.click
end

Then /^I see all expected elements on the page$/ do
  expect(@page).to be_all_there #does not work due to stripe iframe being invisible until clicked
end

Then /^the event name is '(.+)'$/ do |name|
  expect(@page.event_info.event_name.text).to eq(name)
end

Then /^the event description is '(.+)'$/ do |description|
  expect(@page.event_info.event_description.text).to eq(description)
end

Then /^the event location is '(.+)'$/ do |loc|
  expect(@page.event_info.event_location.text).to eq(loc)
end

Then /^the event cost is '(.+)'$/ do |cost|
  expect(@page.event_info.event_cost.text).to eq(cost)
end

Then /^the event page is using https$/ do
  expect(@page.secure?).to be_truthy
end

Then /^the event navigational button text reads '(.+)'$/ do |text|
  expect(@page.event_info.nav_button.text).to eq(text)
end

Then /^the stripe payment overlay is (not )?displayed$/ do |negation|
  action = negation.blank? ? :to : :to_not
  stripe_delay { expect(@page.find('.stripe_checkout_app')).send(action, be_visible) }
end

And /^I set the (first|last) name to '(.+)'$/ do |place, name|
  @page.registration.hash_names.select { |x| x.visible? }.send(place.to_sym).set(name)
end

And /^I set the (first|last) kennel to '(.+)'$/ do |place, kennel|
  @page.registration.kennels.select { |x| x.visible? }.send(place.to_sym).set(kennel)
end

And /^I add an attendee with name '(.+)' and kennel '(.+)'$/ do |name, kennel|
  step "I click the 'add' button on the event page"
  step "I set the last name to '#{name}'"
  step "I set the last kennel to '#{kennel}'"
end

And /^I set name to '(.+)'$/ do |name|
  step "I set the first name to '#{name}'"
end

And /^I set kennel to '(.+)'$/ do |kennel|
  step "I set the first kennel to '#{kennel}'"
end

And /^facebook link is (not )?present on event page$/ do |cntrl|
  expect(@page.common_footer.has_facebook_link?).to (cntrl ? be_falsey : be_truthy)
end
