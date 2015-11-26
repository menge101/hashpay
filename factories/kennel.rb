FactoryGirl.define do
  factory :kennel, class: Kennel do
    full_name 'Pittsburgh Prophylactic Problems Hash House Harriers'
    abbreviation
    description 'A running club with a children problem'
    region 'Pittsburgh, PA, USA'
    founding Time.zone.parse('2015-08-02 14:00:00')
    allow_rego? true
  end

  sequence :abbreviation do |n|
    "TST#{n}"
  end

  trait :kennel_allow_rego do
    allow_rego? true
  end

  trait :kennel_disable_rego do
    allow_rego? false
  end

  trait :with_facebook do
    facebook_url 'https://www.facebook.com/groups/883347525061033/'
  end
end