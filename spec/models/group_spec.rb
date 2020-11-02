require 'rails_helper'

RSpec.describe Group, type: :model do
  context "Validations" do
    user2 = User.create!(name: "user_2")
    it 'names cannot be empty' do
        group1 = Group.new(author_id: user2.id, name: "").save
        expect(group1).to eq(false)
    end

    it 'names cannot be less than 3 characters' do
      names = Group.new(author_id: user2.id, name: 'ab').save
      expect(names).to eq(false)
    end

    it 'group can be without image zero' do
      group2 = Group.new(author_id: user2.id, name: 'abc').save
      expect(group2).to eq(true)
    end
  end
end
