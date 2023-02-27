class RecipesController < ApplicationController
    def new
        @recipe = current_user.recipes.build()
    end
    def create
        @recipe = current_user.recipes.build(recipe_params)
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
    def edit
        @recipe = Recipe.find(params[:id])
        @ingredients = @recipe.ingredients
    end
    def update
        @recipe = Recipe.find(params[:id])
        if params[:commit] == "Add Ingredient"
            @ingredient = Ingredient.find_or_create_by(name: recipe_params[:ingredient][:name])
        
            @il = IngredientsList.new(recipe_id: @recipe.id, ingredient_id: @ingredient.id)
            @il.save
            @ingredients = @recipe.ingredients
            redirect_to edit_recipe_path(@recipe)
        elsif params[:commit] == "Update Recipe"
            @recipe.update(recipe_params)
        else
            @ingredient = Ingredient.find_by(name: params[:button]) 
            @il = IngredientsList.find_by(ingredient_id: @ingredient.id, recipe_id: @recipe.id)
            @il.delete
            redirect_to edit_recipe_path(@recipe)
        end
    end
    private
    def recipe_params
        params.require(:recipe).permit(:name, :user_id, :body, ingredient: :name)
    end
end
