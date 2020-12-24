class UserMoodRelation < ApplicationRecord
  belongs_to :mood
  bolongs_to :user
end
