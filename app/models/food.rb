class Food < ApplicationRecord
  belongs_to :category, optional: true
  has_and_belongs_to_many :recipes

  validates :name, presence: true
end
