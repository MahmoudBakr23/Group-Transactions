class User < ApplicationRecord
    validates :name, presence: true, uniqueness: true, length: {minimum:3, maximum:16}

    has_many :groups, foreign_key: "author_id", dependent: :destroy
    has_many :charges, foreign_key: "author_id", dependent: :destroy
end
