require 'rails_helper'

RSpec.describe 'create user', type: :system do
  scenario 'provide valid Email but leave password blank' do
    visit root_path
    # Utilize link id to disambiguate similar links
    click_link 'header-sign-in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: ''
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end

  scenario 'provide valid Email but input password that is too short' do
    visit root_path
    click_link 'header-sign-in'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'abc'
    click_button 'Log in'

    expect(page).to have_content('Invalid Email or password')
  end
end
