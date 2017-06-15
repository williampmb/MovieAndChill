class Reservation < ApplicationRecord
	has_one :ticket
end
