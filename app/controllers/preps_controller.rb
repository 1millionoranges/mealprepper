class PrepsController < ApplicationController
    before_action :owned_by_current_user?, only: [:update]



    def new
        @prep = current_user.preps.build()
    end
    def show
        @prep = Prep.find(params[:id])
        @recipes = @prep.recipes
        @ingredients = @prep.ingredients_lists
        if current_user 
            @user_recipes_options = current_user.recipes.map{|r| [r.name, r.id]}
            @liked_recipes_options = current_user.liked_recipes.map{|r| [r.name, r.id]}
            @created_or_liked_recipes_options = [["Your recipes"] + [@user_recipes_options]] + [["Saved recipes"] + [@liked_recipes_options]]
            p @created_or_liked_recipes_options
            @owned = (@prep.user_id == current_user.id)
            @saved = SavedPrep.where(user_id: current_user.id, prep_id: @prep.id).any?
        end
        
    end
    def create
        @prep = current_user.preps.build(prep_params)
        if @prep.save
            flash[:success] = "Prep creation successful"
            redirect_to @prep
        else
            flas[:failure] = "Something went wrong"
            render :new, status: :unprocessable_entity
        end
    end
    def index
        if current_user
            @preps = current_user.preps
            @liked_preps = current_user.liked_preps
        else
            @preps = Prep.where(public: true)
        end
    end
    def update
        
        @prep = Prep.find(params[:id])
        if @prep.user_id != current_user.id
            redirect_to @prep
        else
            if params[:toggle_public] == "1"
                p "toggling public"
                if @prep.public == 0
                    @prep.public = 1
                else
                    @prep.public = 0
                end
                @prep.save
            end
            if params[:commit] == "remove this recipe"
                recipe = Recipe.find_by(name: params[:recipe_name])
                recipe_list = RecipeList.where(prep_id: @prep.id, recipe_id: recipe.id)
                RecipeList.delete(recipe_list.first)
                flash[:success] = "Recipe removed successfully"
                redirect_to @prep
            else
                
                @rl = @prep.recipe_lists.build(recipe_id: params[:recipe_id])
                @rl.save
                redirect_to @prep
            end
        end
    end
    def public_index
        @preps = Prep.where(public: true)
    end
    private
    def prep_params
        params.require(:prep).permit(:name)
    end

    def owned_by_current_user?
        if current_user
            Prep.find(params[:id]).user_id == current_user.id
        end
        return false
    end
end
