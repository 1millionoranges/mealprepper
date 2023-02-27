class RecipeList < ApplicationRecord
    belongs_to :prep
    belongs_to :recipe
end
