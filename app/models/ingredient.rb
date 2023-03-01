class Ingredient < ApplicationRecord
    validates :name, presence: true

    has_many :ingredients_lists
    has_many :amounts, through: :ingredients_lists
    has_many :units, through: :ingredients_lists
    has_many :recipes, through: :ingredients_lists
end
