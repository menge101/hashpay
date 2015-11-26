FactoryGirl.define do
  factory :user, class: User do
    first_name 'test'
    last_name 'test'
    hash_name 'testy'
    email 'test@test.org'
    password 'test1'
    password_confirmation 'test1'
  end
end