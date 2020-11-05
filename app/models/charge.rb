class Charge < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :chargings, dependent: :destroy
  has_many :groups, through: :chargings

  validates :name, presence: true, length: { minimum: 3, maximum: 20 }
  validates :amount, presence: true

  scope :charged_by_date, -> { order(created_at: :desc) }
end
