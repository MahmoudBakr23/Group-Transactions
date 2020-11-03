require 'rails_helper'

RSpec.feature "UserExternalSpec.rbs", type: :feature do
  before(:each) do
    @user5 = User.create!(name: "user_5")
    visit '/login'
    fill_in "Name",	with: "user_5"
    click_button 'Login'
    visit root_path
    click_link 'user_5'
    click_link 'All My External Charges' 
  end

  it 'should display amount' do
    expect(page).to have_text('There is no extrnal charges yet')
  end
  
  it 'should create a new charge' do
    click_link 'user_5'
    click_link 'All My Charges'
    click_link 'Add new charge'
    fill_in "Name",	with: "First Charge"
    fill_in "Amount",	with: 10
    click_button 'Create'
    expect(page).to have_link('Update')
    expect(page).to have_link('Delete')
    expect(page).to have_text('no groups yet')
  end
end
