class PrepsController < ApplicationController
    def new
        @prep = Prep.new
    end
    def show
        @prep = Prep.find(params[:id])
        @recipes = @prep.recipes
    end
    def create
        @prep = Prep.new(prep_params)
        if @prep.save
            redirect_to @prep
        else
            render :new, status: :unprocessable_entity
        end
    end
    def index
        @preps = current_user.preps
    end
    private
    def prep_params
        params.require(:prep).permit(:name)
    end
end
