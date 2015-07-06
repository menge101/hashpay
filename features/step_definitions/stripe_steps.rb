When /^I enter '(.+)' in the email field$/ do |email|
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'email').send_keys(email)
  end
end

When /^I enter a valid visa card$/ do
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'card_number').send_keys(VISA_CREDIT)
  end
end

When /^I enter a expiration date in the future$/ do
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'cc-exp').send_keys(120.days.from_now.strftime('%m/%y'))
  end
end

When /^I enter a cvc code of '(.+)'$/ do |cvc|
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'cc-csc').send_keys(cvc)
  end
end

When /^I click the stripe pay button$/ do
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'submitButton').click
  end
end