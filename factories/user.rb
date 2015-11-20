FactoryGirl.define do
  factory :user, class: User do
    first_name 'test'
    last_name 'test'
    hash_name 'testy'
    email 'test@test.org'
    password 'testtest1'
    password_confirmation 'testtest1'
  end

  trait :confirmed do
    confirmed_at (Time.zone.now - 1.day)
  end

end