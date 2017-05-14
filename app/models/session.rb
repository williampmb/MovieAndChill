class Session < ApplicationRecord
	belongs_to :room
	belongs_to :movie
	has_many :tickets
end
