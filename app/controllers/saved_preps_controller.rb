class SavedPrepsController < ApplicationController
    def new
        SavedPrep.new
    end
    def create
        @prep = Prep.find(params[:saved_prep_id])
        @s = SavedPrep.new(prep_id: params[:saved_prep_id], user_id: current_user.id)
        @s.save
        redirect_to @prep
    end
    def delete
        @prep = Prep.find(params[:saved_prep_id])
        @s = SavedPrep.find_by(prep_id: params[:saved_prep_id], user_id: current_user.id)
        SavedPrep.delete(@s)
        redirect_to @prep
    end
end
