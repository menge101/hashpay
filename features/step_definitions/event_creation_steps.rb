Given /^a default event$/ do
  if @kennel
    @event = FactoryGirl.create(:event, { hash_kennel: @kennel })
  else
    @event = FactoryGirl.create(:event)
    @kennel = @event.hash_kennel
  end
end

Given /^an event with cost of '(.+)'$/ do |cost|
  @event = FactoryGirl.create(:event, cost: cost)
  @kennel = @event.hash_kennel
end

Given /^an event with a date (.+) days in the past$/ do |day_count|
  @event = FactoryGirl.create(:event, date: (DateTime.now - day_count.to_i.days))
  @kennel = @event.hash_kennel
end

Given /^an event with rego (enabled|disabled)$/ do |status|
  action = (status == 'enabled') ? :rego_allowed : :rego_forbidden
  if @kennel
    @event = FactoryGirl.create(:event, action, { hash_kennel: @kennel } )
  else
    @event = FactoryGirl.create(:event, action)
    @kennel = @event.hash_kennel
  end

end