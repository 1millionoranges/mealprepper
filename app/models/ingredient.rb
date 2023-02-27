class Ingredient < ApplicationRecord

    has_many :ingredients_lists
    has_many :recipes, through: :ingredients_lists
end
