class Corp < ApplicationRecord
  ENTITY_TYPES = ["Corp", "LLC", "Other"]
  belongs_to :user
end
