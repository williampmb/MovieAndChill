class Session < ApplicationRecord
	belongs_to :room
	belongs_to :movie
	has_many :tickets
	
	def reservatedchairs
		chairs = []
		puts "--------------------------------------"
		tickets.each do |t|
			puts "--------------------------------------"
			puts t.chair
			puts "--------------------------------------"
			chairs.push(t.chair)
		end
		chairs
	end

end
