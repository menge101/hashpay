When /^I enter '(.+)' in the email field$/ do |email|
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'email').send_keys(email == 'a random email' ? Faker::Internet.email : email)
  end
end

When /^I enter (a valid|an invalid) visa card$/ do |card|
  card_mapping = { 'a valid' => VISA_CREDIT, 'an invalid' => INVALID_CARD}
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element(:id, 'card_number').send_keys(card_mapping[card])
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

When /^I click the stripe cancel button$/ do
  within_frame 'stripe_checkout_app' do
    page.driver.browser.find_element('a', class: 'close_right')
  end
end

Then /^the credit card field is marked invalid$/ do
  within_frame 'stripe_checkout_app' do
    expect(page.driver.browser.find_element(:id, 'card_number').find_element(:xpath, '..')[:class]).to include('invalid')
  end
end