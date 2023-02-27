class PrepsController < ApplicationController
    def new
        @prep = current_user.preps.build()
    end
    def show
        @prep = Prep.find(params[:id])
        @recipes = @prep.recipes
        liked_or_saved = current_user.recipes + current_user.liked_recipes
        @user_recipes_options = liked_or_saved.map{|r| [r.name, r.id]}
        @ingredients = @prep.ingredients_lists
        @owned = (@prep.user_id == current_user.id)
    end
    def create
        @prep = current_user.preps.build(prep_params)
        if @prep.save
            redirect_to @prep
        else
            render :new, status: :unprocessable_entity
        end
    end
    def index
        @preps = current_user.preps
        @liked_preps = current_user.liked_preps
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
    def user_owned

    end
end
