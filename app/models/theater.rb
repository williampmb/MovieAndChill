class Theater < ApplicationRecord
	has_many :movie_theater
	has_many :rooms
end
