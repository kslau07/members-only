require 'rails_helper'
# include Warden::Test::Helpers

RSpec.describe 'create user', type: :system do
  user = User.create!(:email => 'test_user@example.com', :password => 'f4k3p455w0rd')
  login_as(user, :scope => :user)

  # scenario 'provide valid Email but leave password blank' do
  #   visit root_path
  #   # Utilize link id to disambiguate similar links
  #   click_link 'header-sign-in'
  #   fill_in 'Email', with: 'user@example.com'
  #   fill_in 'Password', with: ''
  #   click_button 'Log in'
  #
  #   expect(page).to have_content('Invalid Email or password')
  # end
  #
  # scenario 'provide valid Email but input password that is too short' do
  #   visit root_path
  #   click_link 'header-sign-in'
  #   fill_in 'Email', with: 'user@example.com'
  #   fill_in 'Password', with: 'abc'
  #   click_button 'Log in'
  #
  #   expect(page).to have_content('Invalid Email or password')
  # end
end
