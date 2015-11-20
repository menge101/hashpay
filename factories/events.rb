FactoryGirl.define do
  #Default Event
  factory :event, class: Event do
    name 'Test Event'
    cost 50.01
    date
    description 'A test event'
    location '2020 Smallman Street, Pittsburgh, PA'
    allow_rego? true
    kennel
  end

  sequence :date do |n|
    DateTime.now + n.to_i.days + 100.days
  end

  sequence :name do |n|
    "Run ##{n}"
  end

  trait :event_rego_allowed do
    allow_rego? true
  end

  trait :event_rego_forbidden do
    allow_rego? false
  end

  trait :future do
    date Time.zone.now + 5.days
  end

  trait :past do
    date Time.zone.now - 5.days
  end
end