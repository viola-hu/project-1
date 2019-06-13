class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :reviews, dependent: :destroy

  has_and_belongs_to_many :foods
  before_destroy { foods.clear }  # remove foods from join table for this recipe

  validates :name, presence: true
  validates :ingredients, presence: true
end
