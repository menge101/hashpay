Then /^the attendee list has (.+) entr.*$/ do |count|
  expect(ViewPage.new.hasher_listing.hasher_names.size).to eq count.to_i
end

Then /^the attendee list (first|last) entry has name '(.+)' and kennel '(.+)'$/ do |location, name, kennel|
  @view = ViewPage.new
  name_array = @view.hasher_listing.hasher_names.map { |element| element.text }
  kennel_array = @view.hasher_listing.kennels.map { |element| element.text }
  expect(name_array).to include(name)
  expect(kennel_array).to include(kennel)
end