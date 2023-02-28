class SavedRecipesController < ApplicationController
    def new
        SavedRecipe.new
    end
    def create
        @recipe = Recipe.find(params[:saved_recipe_id])
        @saved_recipe = SavedRecipe.new(recipe_id: params[:saved_recipe_id], user_id: current_user.id)
        p @saved_recipe
        @saved_recipe.save
        redirect_to @recipe
    end

    def delete
        @recipe = Recipe.find(params[:saved_recipe_id])
        @s = SavedRecipe.find_by(recipe_id: params[:saved_recipe_id], user_id: current_user.id)
        SavedRecipe.delete(@s)
        redirect_to @recipe
    end
end
