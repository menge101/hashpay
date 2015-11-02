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
  sleeping(0.5).seconds.between_tries.failing_after(10).tries do
    expect(PAGE_MAP[page.downcase].new).to be_displayed
  end
end
