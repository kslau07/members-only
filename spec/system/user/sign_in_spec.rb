# frozen_string_literal: true

require 'rails_helper'

feature 'Logging in' do
  given!(:user) { FactoryBot.create(:user) }

  scenario 'signs the user in successfully with a valid email and password' do
    User.create(email: 'test_user@example.com', password: 'password123')
    sign_in_with 'test_user@example.com', 'password123'
    page_content_has 'You are signed in.'
  end

  scenario 'notifies the user if their email or password is invalid' do
    sign_in_with 'user@example.com', 'invalid_password'
    page_content_has 'Invalid Email or password.'
  end

  # These methods are used to DRY up repetitive tasks and to read better as plain English

  def sign_in_with(email, password)
    visit root_path
    click_link 'header-sign-in'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    click_button 'Log in'
  end

  def page_content_has(text)
    expect(page).to have_content(text)
  end
end
