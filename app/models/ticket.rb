class Ticket < ApplicationRecord
	belongs_to :purchase
	belongs_to :session
end
