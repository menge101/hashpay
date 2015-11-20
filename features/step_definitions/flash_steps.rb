Then /^an? (alert|notice|error|warning) message is flashed reading '(.*?)'$/ do |type, msg|
  class_mapping = { 'notice' => 'alert-info', 'warning' => 'alert-warning' }
  current = ViewPage.new
  current.wait_for_flash_messages
  sleeping(0.5).seconds.between_tries.failing_after(20).tries do
    expect(current.flash_messages.text).to eq(msg)
  end
  expect(EventPage.new.flash.messages.first[:class]).to include(class_mapping[type])
end