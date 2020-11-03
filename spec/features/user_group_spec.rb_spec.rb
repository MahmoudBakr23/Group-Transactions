require 'rails_helper'

RSpec.feature 'UserGroupSpec.rbs', type: :feature do
  before(:each) do
    @user4 = User.create!(name: 'user_4')
    visit '/login'
    fill_in 'Name',	with: 'user_4'
    click_button 'Login'
    visit root_path
    click_link 'user_4'
    click_link 'All Groups'
  end

  it 'should display amount' do
    expect(page).to have_text('All Groups')
  end

  it 'should have a button to create new charge' do
    expect(page).to have_link('Add group')
  end

  it 'should create a new group' do
    click_link 'Add group'
    fill_in 'Name',	with: 'First Group'
    click_button 'Add Group'
    expect(page).to have_link('Update')
    expect(page).to have_link('Delete')
  end
end
