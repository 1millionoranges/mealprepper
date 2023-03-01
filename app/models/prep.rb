class Prep < ApplicationRecord
    belongs_to :user
    has_many :recipe_lists
    has_many :recipes, through: :recipe_lists
    has_many :ingredients_lists, through: :recipes

    validates :name, presence: true
    validates :user_id, presence: true

    
end
