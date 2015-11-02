PAGE_MAP = { 'event' => EventPage, 'kennel' => KennelPage, 'sign up' => SignUpPage, 'login' => LoginPage,
             'forgot password' => ForgotPasswordPage, 'whosecoming' => ViewPage, 'front' => FrontPage }

BUTTON_MAP = { 'sign up' => :signup_btn, 'log in' => :log_in_btn, 'submit' => :button }

When /^I register as a new user with email '(.*?)' and password '(.*?)'$/ do |email, password|
  step "I enter '#{email}' as the email"
  step "I enter '#{password}' as the password"
  step "I enter '#{password}' as the confirmation"
  step "I click the 'sign up' button on the sign up page"
end

When /^I login with email '(.*?)' and password '(.*?)'$/ do |email,password|
  step "I enter '#{email}' as the email"
  step "I enter '#{password}' as the password"
  step "I click the 'log in' button on the login page"
end

When /^I enter '(.*?)' as the (.*?)$/ do |value, field|
  @page.send(field.to_sym).set(value)
end

When /^I click the '(.*?)' button on the (.*?) page$/ do |btn,page|
  page = PAGE_MAP[page].new
  page.send(BUTTON_MAP[btn]).click
  sleep 5
end