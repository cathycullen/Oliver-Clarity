class Minute < ApplicationRecord
  VOTE_TYPES = ["Unanimous", "Majority", "Super Majority"]
  belongs_to :user
end
