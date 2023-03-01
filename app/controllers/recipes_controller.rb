class RecipesController < ApplicationController
    before_action :owned_by_current_user?, only: [:create, :update]
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
        @ingredients_list = @recipe.ingredients_lists
        if current_user
            @owned = (@recipe.user_id == current_user.id)
            @saved = SavedRecipe.where(recipe_id: @recipe.id, user_id: current_user.id).any?
        end
    end
    def index
        if current_user
            @user_recipes = current_user.recipes
            @liked_recipes = current_user.liked_recipes
        else
            @user_recipes = Recipe.where(public: true)
        end
    end
    def public_index
        @recipes = Recipe.where(public: true)
    end
    def edit
        @recipe = Recipe.find(params[:id])
        
        @ingredients_lists = @recipe.ingredients_lists
    end
    def update
        @recipe = Recipe.find(params[:id])       
        @recipe.update(recipe_params)
        if new_ingredient_params[:newingredient][:name] != ""
            p new_ingredient_params
            @ingredient = Ingredient.find_or_create_by(name: new_ingredient_params[:newingredient][:name])
            @new_ingred_list = @recipe.ingredients_lists.build
            @new_ingred_list.ingredient_id = @ingredient.id
            @new_ingred_list.update(amount:  new_ingredient_params[:newingredient][:amount], unit: new_ingredient_params[:newingredient][:unit])
            @new_ingred_list.save
        end
        redirect_to @recipe


    end
    private
    def recipe_params
        params.require(:recipe).permit(:public, :name, :user_id, :body , ingredients_lists_attributes: [:id, :ingredient_id, :recipe_id, :amount, :unit, :_destroy])
    end
    def new_ingredient_params
        params.require(:recipe).permit(newingredient: [:name, :unit, :amount])
    end
    def owned_by_current_user?
        if current_user
            Recipe.find(params[:id]).user_id == current_user.id
        end
        return false
    end
end
