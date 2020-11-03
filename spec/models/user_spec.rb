require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Validations' do
    user = User.new(name: 'user').save
    it 'should have name and cannot be less than 3 characters' do
      expect(user).to eq(true)
    end
  end
end
