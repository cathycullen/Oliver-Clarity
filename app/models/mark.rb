class Mark < ApplicationRecord
  COLORS = ["Yellow", "Red", "Blue", "Orange", "Purple", "Green"]
  belongs_to :user
end
