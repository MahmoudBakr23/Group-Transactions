require 'rails_helper'

RSpec.feature "UserChargesSpec.rbs", type: :feature do
  before(:each) do
    @user3 = User.create!(name: "user_3")
    visit '/login'
    fill_in "Name",	with: "user_3"
    click_button 'Login'
    visit root_path
    click_link 'user_3'
    click_link 'All My Charges' 
  end

  it 'should display amount' do
    expect(page).to have_text('Total Amount')
  end

  it 'should have a button to create new charge' do
    expect(page).to have_link('Add new charge')  
  end

  it 'should create a new charge' do
    click_link 'Add new charge'
    fill_in "Name",	with: "First Charge"
    fill_in "Amount",	with: 10
    click_button 'Create'
    expect(page).to have_link('Update')
    expect(page).to have_link('Delete')
  end
end
