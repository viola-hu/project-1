class Review < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :recipe, optional: true

  validates :rating, presence: true 
end
