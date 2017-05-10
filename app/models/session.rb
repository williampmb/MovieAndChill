class Session < ApplicationRecord
	belongs_to :room
	belongs_to :movie
end
