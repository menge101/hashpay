def slow_keys(element, text)
  text.to_s.each_char do |c|
    element.send_keys(c)
    sleep(0.05)
  end
end

def build_confirmation_path
  "/users/confirmation?#{ActionMailer::Base.deliveries.last.body.match(/confirmation_token=[^'"]+/)}"
end

def last_email_has_token?(token)
  ActionMailer::Base.deliveries.last.body.include? token
end