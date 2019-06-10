class Recipe < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category, optional: true
  has_many :reviews

  validates :name, presence: true
  validates :ingredients, presence: true
  validates :category_id, presence: true
end
