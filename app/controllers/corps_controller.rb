class CorpsController < ApplicationController
    validates_associated :user
    belongs_to :user
end
