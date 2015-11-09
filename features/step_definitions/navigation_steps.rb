PAGE_MAP = { 'event' => EventPage, 'kennel' => KennelPage, 'whosecoming' => ViewPage }

When /^I navigate to the (.*?) page$/ do |page|
  @page = PAGE_MAP[page.downcase].new
  if page == 'kennel'
    abrv = @kennel ? @kennel.abbreviation : 'P3H3'
    @page.load(abbreviation: abrv)
  else
    @page.load
  end
end

Then /^the '(.*?)' page is displayed$/ do |page|
  expect(PAGE_MAP[page.downcase].new).to be_displayed
end
