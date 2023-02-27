class RecipesController < ApplicationController
    def new
        @recipe = Recipe.new
    end
    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else
            render :new, status: :unprocessable_entity
        end
    end
    def show
        @recipe = Recipe.find(params[:id])
        @ingredients = @recipe.ingredients
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :user_id, :body)
    end
end
