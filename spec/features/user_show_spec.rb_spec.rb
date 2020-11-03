require 'rails_helper'

RSpec.feature "UserShowSpec.rbs", type: :feature do
  before(:each) do
    @user = User.create!(name: 'Logged User')
    visit '/login'
    fill_in "Name",	with: "Logged User"
    click_button 'Login' 
  end

  it 'suppose to show a link to user profile' do
    visit root_path
    expect(page).to have_link('Logged User')  
  end

  it 'suppose to show link to logout' do
    visit root_path
    expect(page).to have_link('Log out')  
  end

  it 'suppose to show link to delete the account' do
    visit root_path
    expect(page).to have_link('Delete my account')  
  end
end
