require 'rails_helper'

RSpec.feature 'HomeIndexSpec.rbs', type: :feature do
  it 'shows navigation link to log in' do
    visit root_path
    expect(page).to have_link('Login')
  end

  it 'shows navigation link to sign up' do
    visit root_path
    expect(page).to have_link('Sign up')
  end
end
