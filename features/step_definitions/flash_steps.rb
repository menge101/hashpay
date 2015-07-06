Then /^an? (alert|notice|error) message is flashed reading '(.*?)'$/ do |type, msg|
  class_mapping = { 'notice' => 'alert-info' }
  current = ViewPage.new
  current.wait_for_flash_messages
  expect(current.flash_messages.text).to eq(msg)
  expect(current.flash_messages[:class]).to include(class_mapping[type])
end