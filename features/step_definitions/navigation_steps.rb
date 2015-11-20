When /^I navigate to the (.*?) page$/ do |page|
  @page = PAGE_MAP[page.downcase].new
  if page == 'kennel'
    id = @kennel ? @kennel.id : '1'
    @page.load(id: id)
  elsif page == 'event'
    id = @event ? @event.id : '1'
    @page.load(id: id)
  else
    @page.load
  end
end

Then /^the '(.*?)' page is displayed$/ do |page|
  ui_response_delay do
    expect(PAGE_MAP[page.downcase].new).to be_displayed
  end
end

Then /^the data upload section is displayed$/ do
  ui_response_delay do
    expect(@page).to have_data_upload
  end
end

Then /^the data upload section is not displayed$/ do
  ui_response_delay do
    expect(@page).to_not have_data_upload
  end
end
