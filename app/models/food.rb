class Food < ApplicationRecord
  belongs_to :category, optional: true
end
