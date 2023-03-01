class SavedPrep < ApplicationRecord
    belongs_to :user
    belongs_to :prep
    before_create :already_exists?
    private
    def already_exists?
        SavedPrep.where(user_id: self.user_id, prep_id: self.prep_id).any?
    end
end
