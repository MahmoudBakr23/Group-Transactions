class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'

  has_many :chargings, dependent: :destroy
  has_many :charges, through: :chargings

  validates :name, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }

  has_attached_file :image,
    :storage => :cloudinary,
    :path => ':class/:id/:style/:filename'
  validates_attachment_content_type :image, content_type: ['image/jpg', 'image/jpeg', 'image/png']

  scope :grouped_by_date, -> { order(created_at: :desc) }
  scope :grouped_by_charge_id, -> { order(charge_id: :asc) }
end
