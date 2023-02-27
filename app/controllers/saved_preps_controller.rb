class SavedPrepsController < ApplicationController
    def new
        SavedPrep.new
    end
    def create
        @s = SavedPrep.new(prep_id: params[:saved_prep_id], user_id: current_user.id)
        @s.save
    end

end
