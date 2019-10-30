class Review < ApplicationRecord
  belongs_to :user

  validates_inclusion_of :rating, in: 1..5
end
