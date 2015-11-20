Given /^an authenticated user$/ do
  @user = FactoryGirl.create(:user, :confirmed)
  login_as(@user, scope: :user)
end

Given /^a user that is not authenticated$/ do
  @user = FactoryGirl.create(:user, :confirmed)
  logout(:user)
end