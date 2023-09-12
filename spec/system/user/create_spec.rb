require 'rails_helper'

RSpec.describe 'create user', type: :system do
  let(:user) { build(:user) }

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
    difference = 1
    initial_count = User.count

    visit root_path
    click_link 'Sign up'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'F4k3p455w0rd'
    fill_in 'Password confirmation', with: 'F4k3p455w0rd'
    click_button 'Sign up'


    expect(page).to have_content('Welcome! You have signed up successfully.')

    final_count = User.count
    expect(final_count - initial_count).to eq(difference)
  end

  scenario 'have FactoryBot create a user' do
    expect(user.email).to eq 'user1@example.com'
  end

  scenario 'have FactoryBot create another user' do
    difference = 1
    initial_count = User.count

    second_user = create(:user_second)

    expect(second_user.email).to eq 'user2@example.com'

    final_count = User.count
    expect(final_count - initial_count).to eq(difference)
  end

  scenario 'have FactoryBot create a user with Faker' do
    difference = 1
    initial_count = User.count

    faker_user = create(:user_faker)
    expect(faker_user.email).to eq 'user_faker@example.com'

    final_count = User.count
    expect(final_count - initial_count).to eq(difference)
  end
end
