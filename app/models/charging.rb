class Charging < ApplicationRecord
  belongs_to :charge
  belongs_to :group
end
