class UsersAttorney < ApplicationRecord
  belongs_to :user
  belongs_to :attorney
end
