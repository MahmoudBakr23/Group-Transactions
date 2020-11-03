require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Capability' do
    it 'creates user' do
      user = User.new(name: 'Second User').save
      expect(user).to eq(true)
    end
  end
end
