# frozen_string_literal: true

require 'rails_helper'

feature 'User sign up' do
  scenario 'sign up and leave all fields blank' do
    visit root_path
    click_link 'Sign up'
    click_button 'Sign up'
    expect(page).to have_content("Email can't be blank")
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'sign up and provide email but leave password blank' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    click_button 'Sign up'
    expect(page).to have_content("Password can't be blank")
  end

  scenario 'sign up, input valid email but input invalid 3 character password' do
    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'foo'
    click_button 'Sign up'
    expect(page).to have_content('Password is too short')
  end

  scenario 'fill in a valid email and password' do
    visit root_path
    initial_count = User.count
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'password123'
    fill_in 'Password confirmation', with: 'password123'
    click_button 'Sign up'
    final_count = User.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
    expect(page).to have_content('Welcome! You have signed up successfully.')
  end

  scenario 'have FactoryBot create a user' do
    initial_count = User.count
    create(:user)
    final_count = User.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
  end

  scenario 'have FactoryBot create another user' do
    initial_count = User.count
    create(:user)
    final_count = User.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
  end

  scenario 'have FactoryBot create a user with Faker' do
    initial_count = User.count
    create(:user, :faker)
    final_count = User.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
  end
end
