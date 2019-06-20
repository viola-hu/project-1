class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :reviews, dependent: :destroy
  # :dependent options:
  # 1) :destroy, when the object is destroyed, destroy will be called on its associated objects.
  # 2) :delete, when the object is destroyed, all its associated objects will be deleted directly from the database without calling their destroy method.


  has_and_belongs_to_many :foods
  before_destroy { foods.clear }  # remove foods from join table for this recipe

  validates :category, presence: true
  validates :name, presence: true
  validates :ingredients, presence: true
end
