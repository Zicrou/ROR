class Word < ApplicationRecord
    has_many :comments, dependent: :destroy
    validates :nature, presence: true,
                    length: { minimum: 4 }
end
