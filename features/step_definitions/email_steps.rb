When /^I navigate to the confirmation link in my email$/ do
  visit build_confirmation_path
end

Then /^an email has been sent$/ do
  expect(ActionMailer::Base.deliveries.size).to eq 1
end