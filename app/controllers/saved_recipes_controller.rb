class SavedRecipesController < ApplicationController
    def new
        SavedRecipe.new
    end
    def create
        @saved_recipe = SavedRecipe.new(recipe_id: params[:saved_recipe_id], user_id: current_user.id)
        p @saved_recipe
        @saved_recipe.save
    end


end
