class Prep < ApplicationRecord
    has_many :recipe_lists
    has_many :recipes, through: :recipe_lists
end
