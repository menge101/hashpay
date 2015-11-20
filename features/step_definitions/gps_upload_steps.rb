Given /^a user and event where GPS data can be uploaded$/ do
  step "an authenticated user"
  step "an event in the past"
end

When /^I enter '(.*?)' in the file chooser$/ do |filename|
  @page.data_upload.browse_button.native.send_keys(Rails.root.join('uploads', filename))
end

When /^I click the submit button$/ do
  @page.data_upload.submit_button.click
end

Then /^I should see a message reading '(.*?)'$/ do |msg|
   ui_response_delay { expect(@page.flash.messages.first.text).to eq msg }
end