When /^I sleep for (.+) seconds$/ do |count|
  sleep(count.to_i)
end

And /^I debug$/ do
  sleep 5
  sleep 1
end