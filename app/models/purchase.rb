class Purchase < ApplicationRecord
	has_many :ticket
	belongs_to :user
end
