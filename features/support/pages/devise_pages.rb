class SignUpPage < SitePrism::Page
  set_url '/users/sign_up'
  element :email, '#user_email'
  element :password, '#user_password'
  element :confirmation, '#user_password_confirmation'
  element :signup_btn, 'input[type="submit"]'
  element :login_nav, 'div.panel-body > a:nth-child(3)'
  element :instr_link, 'div.panel-body > a:nth-child(5)'
end

class LoginPage < SitePrism::Page
  set_url '/users/sign_in'
  element :email, '#user_email'
  element :password, '#user_password'
  element :remember, '#user_remember_me'
  element :log_in_btn, 'input[type="submit"]'
end

class ForgotPasswordPage < SitePrism::Page
  set_url 'users/password/new'
  element :page_label, 'h2'
  element :email, '#user_email'
  element :button, 'input[type="submit"]'
  element :log_in_btn, 'div.panel-body > a:nth-child(3)'
  element :sign_up_link, 'div.panel-body > a:nth-child(5)'
  element :instr_link, 'div.panel-body > a:nth-child(7)'
end