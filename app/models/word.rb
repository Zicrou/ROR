class Word < ApplicationRecord
    validates :nature, presence: true,
                    length: { minimum: 4 }
end
