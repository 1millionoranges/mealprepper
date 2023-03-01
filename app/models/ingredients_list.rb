class IngredientsList < ApplicationRecord
    belongs_to :ingredient
    belongs_to :recipe

    validates :ingredient_id, presence: true
    validates :recipe_id, presence: true

    
end
