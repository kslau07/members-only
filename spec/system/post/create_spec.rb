# frozen_string_literal: true

require 'rails_helper'

feature 'Create a new post' do
  scenario 'When a blank post is submitted, an error is shown' do
    sign_in_with_warden
    visit root_path
    click_link 'New whispr'
    fill_in 'post_body', with: ''
    click_button 'Submit'
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'When a new post is submitted with valid text, no errors occur' do
    sign_in_with_warden
    visit root_path
    click_link 'New whispr'
    fill_in 'post_body', with: 'I have a secret to tell'
    click_button 'Submit'
    expect(page).to have_content('I have a secret to tell')
  end

  def sign_in_with_warden
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end
end
