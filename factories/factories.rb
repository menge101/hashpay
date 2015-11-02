FactoryGirl.define do

  sequence :abbreviation do |n|
    "TST#{n}"
  end

  sequence :date do |n|
    DateTime.now + n.to_i.days + 100.days
  end

  sequence :name do |n|
    "Run ##{n}"
  end

  #Default Event
  factory :event, class: Event do
    name 'Test Event'
    cost 50.01
    date
    description 'A test event'
    location '2020 Smallman Street, Pittsburgh, PA'
    allow_rego? true
    association :hash_kennel
  end

  factory :hash_kennel, class: HashKennel do
    full_name 'Pittsburgh Prophylactic Problems Hash House Harriers'
    abbreviation
    description 'A running club with a children problem'
    region 'Pittsburgh, PA, USA'
    founding Time.zone.parse('2015-08-02 14:00:00')
    allow_rego? true
  end

  factory :user, class: User do
    first_name 'test'
    last_name 'test'
    hash_name 'testy'
    email 'test@test.org'
    password 'test1'
    password_confirmation 'test1'
  end

  trait :rego_allowed do
    allow_rego? true
  end

  trait :rego_forbidden do
    allow_rego? false
  end

  trait :with_facebook do
    facebook_url 'https://www.facebook.com/groups/883347525061033/'
  end
end