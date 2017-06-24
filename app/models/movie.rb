class Movie < ApplicationRecord
	has_many :movie_theater
	has_many :sessions
	has_attached_file :image, styles: { medium: "300x300>", thumb: "75x100#" }, default_url: "/assets/missing75x100.jpg"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
