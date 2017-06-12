class Ticket < ApplicationRecord
	belongs_to :purchase
	belongs_to :session
	belongs_to :reservation, optional: true
end
