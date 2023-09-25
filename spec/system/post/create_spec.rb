# frozen_string_literal: true

require 'rails_helper'

feature 'Create a new post' do
  scenario 'Try to create a new post with empty content' do
    sign_in_with_warden
    visit root_path
    click_link 'New whispr'
    fill_in 'post_body', with: ''
    click_button 'Submit'
    expect(page).to have_content("Body can't be blank")
  end

  scenario 'Create a new post with content' do
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
