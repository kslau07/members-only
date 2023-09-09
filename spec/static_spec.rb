require 'rails_helper'

RSpec.describe 'Static content', type: :system do
  it 'shows static content for a 404 error' do
    visit '/404.html'
    expect(page).to have_content("The page you were looking for doesn't exist.")
  end

  it 'shows static content for a 422 error' do
    visit '/422.html'
    expect(page).to have_content('The change you wanted was rejected.')
  end

  it 'shows static content for a 500 error' do
    visit '/500.html'
    expect(page).to have_content("We're sorry, but something went wrong.")
  end
end
