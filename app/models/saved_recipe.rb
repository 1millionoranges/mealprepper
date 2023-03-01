class SavedRecipe < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    before_create :already_exists?
    private
    def already_exists?
        SavedRecipe.where(user_id: self.user_id, recipe_id: self.recipe_id).any?
    end
end
