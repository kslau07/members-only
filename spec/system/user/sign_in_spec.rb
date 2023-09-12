require 'rails_helper'

RSpec.describe 'create user', type: :system do
  # user = User.create!(:email => 'test_user@example.com', :password => 'f4k3p455w0rd')
  # login_as(user, :scope => :user)


  scenario 'sign in manually with Capybara'
  scenario 'sign in with Warden'
end
