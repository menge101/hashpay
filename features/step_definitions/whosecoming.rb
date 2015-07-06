Then /^the attendee list has (.+) entr.*$/ do |count|
  expect(ViewPage.new.hasher_listing.hasher_names.size).to eq count.to_i
end

Then /^the attendee list (first|last) entry has name '(.+)' and kennel '(.+)'$/ do |location, name, kennel|
  @view = ViewPage.new
  expect(@view.hasher_listing.hasher_names.send(location.to_sym).text).to eq(name)
  expect(@view.hasher_listing.kennels.send(location.to_sym).text).to eq(kennel)
end