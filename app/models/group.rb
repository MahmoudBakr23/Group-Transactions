class Group < ApplicationRecord
  belongs_to :author, class_name: "User"

  has_many :chargings, dependent: :destroy
  has_many :charges, through: :chargings

  validates :name, presence: true, length: {minimum:3, maximum:20}
end
