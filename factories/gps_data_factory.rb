FactoryGirl.define do
  factory :gps_data, class: GpsData do
    association :event
    association :user
    file_location nil
    data nil
    status nil
  end
end