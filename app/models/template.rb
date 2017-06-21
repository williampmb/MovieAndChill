class Template < ApplicationRecord
	has_many :rooms

	def print_template
		"Columns: #{col} / Rows: #{row} / Total: #{row*col}"
	end
end
