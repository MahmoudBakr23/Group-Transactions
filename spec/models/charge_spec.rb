require 'rails_helper'

RSpec.describe Charge, type: :model do

    context "Validations" do
      it 'can not be empty' do
          char = Charge.new(name: '').save
          expect(char).to eq(false)
      end
    end

end
