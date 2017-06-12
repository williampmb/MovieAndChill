class Reservation < ApplicationRecord
	has_one :tickets
end
