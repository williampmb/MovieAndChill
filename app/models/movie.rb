class Movie < ApplicationRecord
	has_many :movie_theater
	has_many :sessions
end
