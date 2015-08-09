def slow_keys(element, text)
  verification_string = ''
  text.to_s.each_char do |c|
    element.send_keys(c)
    sleep(0.05)
  end
end