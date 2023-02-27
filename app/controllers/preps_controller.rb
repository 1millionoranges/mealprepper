class PrepsController < ApplicationController
    def new
        @prep = current_user.preps.build()
    end
    def show
        @prep = Prep.find(params[:id])
        @recipes = @prep.recipes
        @user_recipes_options = current_user.recipes.map{|r| [r.name, r.id]}

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
    end
    def update
        @prep = Prep.find(params[:id])
        @rl = @prep.recipe_lists.build(recipe_id: params[:recipe_id])
        @rl.save
        redirect_to @prep
    end
    private
    def prep_params
        params.require(:prep).permit(:name)
    end
end
