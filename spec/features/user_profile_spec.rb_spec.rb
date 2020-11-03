require 'rails_helper'

RSpec.feature 'UserProfileSpec.rbs', type: :feature do
  before(:each) do
    @user1 = User.create!(name: 'user_one')
    visit '/login'
    fill_in 'Name',	with: 'user_one'
    click_button 'Login'
    visit root_path
    click_link 'user_one'
  end

  it 'suppose to go to the profile from home page' do
    expect(page).to have_text("user_one's Profile")
  end

  it 'suppose to have link to show charges' do
    expect(page).to have_link('All My Charges')
  end

  it 'suppose to have link to show external charges' do
    expect(page).to have_link('All My External Charges')
  end

  it 'suppose to have link to show charges' do
    expect(page).to have_link('All Groups')
  end
end
