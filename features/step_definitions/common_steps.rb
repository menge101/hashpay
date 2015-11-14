PAGE_MAP = { 'event' => EventPage, 'kennel' => KennelPage, 'sign up' => SignUpPage, 'login' => LoginPage,
             'forgot password' => ForgotPasswordPage, 'whosecoming' => ViewPage, 'front' => FrontPage }

BUTTON_MAP = { 'sign up' => :signup_btn, 'log in' => :log_in_btn, 'submit' => :button,
               'pay with stripe' => :stripe_button, 'add' => :add_button }

When /^I click the '(.*?)' button on the (.*?) page$/ do |btn, pg|
  page = PAGE_MAP[pg].new
  page = page.registration if pg == 'event'
  page.send(BUTTON_MAP[btn]).click
  sleep 5
end
