class Template < ApplicationRecord
	has_many :rooms

	def print_template
		teste= :rooms
		"#{teste} #{row}"
	end
end
