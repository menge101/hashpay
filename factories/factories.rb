FactoryGirl.define do
  #Default Event
  factory :event, class: Event do
    name 'Test Event'
    cost 50.01
    date Time.zone.parse('2015-08-02 14:00:00')
    description 'A test event'
    location '2020 Smallman Street, Pittsburgh, PA'
    association :hash_kennel
  end

  factory :hash_kennel, class: HashKennel do
    full_name 'Pittsburgh Prophylactic Problems Hash House Harriers'
    abbreviation 'P3H3'
    description 'A running club with a children problem'
    region 'Pittsburgh, PA, USA'
    founding Time.zone.parse('2015-08-02 14:00:00')
  end
end