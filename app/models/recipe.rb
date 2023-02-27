class Recipe < ApplicationRecord
    belongs_to :user

    has_many :ingredients_lists
    has_many :ingredients, through: :ingredients_lists
    has_many :saved_recipes
    
    accepts_nested_attributes_for :ingredients_lists, :allow_destroy => true
    accepts_nested_attributes_for :ingredients
end
