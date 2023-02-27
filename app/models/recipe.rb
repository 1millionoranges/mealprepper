class Recipe < ApplicationRecord
    has_many :ingredients_lists
    has_many :ingredients, through: :ingredients_lists
end
