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
    def index
        @user_recipes = Recipe.where(user_id: current_user.id)
    end

    private
    def recipe_params
        params.require(:recipe).permit(:name, :user_id, :body)
    end
end
