require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe 'Capability' do
    user = User.create!(name: 'First User')
    it 'creates group' do
      group = Group.new(author_id: user.id, name: 'First Group').save
      expect(group).to eq(true)
    end

    it 'updates a group' do
      group1 = Group.create!(author_id: user.id, name: 'Updated Group')
      group1.update(name: 'I am the group!')
      expect(group1.name).to eq('I am the group!')
    end

    it 'adds a group to charge' do
      charge1 = Charge.create!(author_id: user.id, name: 'charge with group', amount: 10)
      group2 = Group.create!(author_id: user.id, name: 'group has a charge')
      charging1 = Charging.create!(group_id: group2.id, charge_id: charge1.id)
      expect(group2.charges.first).to eq(charge1)
    end
  end
end
