class Paper < ApplicationRecord
    validates :title, :venue, presence: true
end
