require 'rails_helper'

RSpec.describe Charge, type: :model do
  context "Validations" do
    user1 = User.create!(name: "user_1")
    it 'charge cannot be empty' do
        charge1 = Charge.new(author_id: user1.id, name: "", amount: 10).save
        expect(charge1).to eq(false)
    end

    it 'names cannot be less than 3 characters' do
      names = Charge.new(author_id: user1.id, name: 'ab', amount: 10).save
      expect(names).to eq(false)
    end

    it 'amount cannot be empty' do
      amounts = Charge.new(author_id: user1.id, name: 'abc', amount: '').save
      expect(amounts).to eq(false)
    end

    it 'amount can be zero' do
      amounts = Charge.new(author_id: user1.id, name: 'abc', amount: 0).save
      expect(amounts).to eq(true)
    end
  end
end
