# frozen_string_literal: true

require 'rails_helper'

feature 'Like a post' do
  before do
    post_author = FactoryBot.create(:user)
    FactoryBot.create(:post, post_author:)
  end

  scenario "Like count goes up by one when 'liked'" do
    sign_in_with_warden
    visit root_path
    initial_count = Like.count
    click_button 'Like'
    final_count = Like.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
  end

  scenario "Like count does not change when 'liked' and 'unliked'" do
    sign_in_with_warden
    visit root_path
    initial_count = Like.count
    click_button 'Like'
    click_button 'Unlike'
    final_count = Like.count
    difference = 0
    expect(final_count - initial_count).to eq(difference)
  end

  def sign_in_with_warden
    user = FactoryBot.create(:user)
    login_as(user, scope: :user)
  end
end
