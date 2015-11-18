Given /^a kennel with rego (enabled|disabled)$/ do |status|
  action = status == 'enabled' ? :rego_allowed : :rego_forbidden
  @kennel = FactoryGirl.create(:kennel, action)
end

Given /^a kennel with facebook$/ do
  @kennel = FactoryGirl.create(:kennel, :with_facebook)
end

Given /^a default kennel$/ do
  @kennel = FactoryGirl.create(:kennel)
end
