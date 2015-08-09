Given /^a kennel with rego (enabled|disabled)$/ do |status|
  action = status == 'enabled' ? :rego_allowed : :rego_forbidden
  @kennel = FactoryGirl.create(:hash_kennel, action)
end
