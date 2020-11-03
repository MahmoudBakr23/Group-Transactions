require 'rails_helper'

RSpec.describe 'Charges', type: :request do
  describe 'Capability' do
    user = User.create!(name: 'Third User')
    it 'creates charge' do
      charge = Charge.new(author_id: user.id, name: 'First Charge', amount: 10).save
      expect(charge).to eq(true)
    end

    it 'updates a charge' do
      charge1 = Charge.create!(author_id: user.id, name: 'Updated charge', amount: 10)
      charge1.update(name: 'I am the charge!', amount: 20)
      expect(charge1.name).to eq('I am the charge!')
      expect(charge1.amount).to eq(20)
    end

    it 'adds a group to charge' do
      group1 = Group.create!(author_id: user.id, name: 'group with charge')
      charge2 = Charge.create!(author_id: user.id, name: 'charge in group', amount: 10)
      charging1 = Charging.create!(group_id: group1.id, charge_id: charge2.id)
      expect(charge2.groups.first).to eq(group1)
    end
  end
end
