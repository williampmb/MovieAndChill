class User < ApplicationRecord
	has_many :purchases
	has_many :tickets, :through => :purchases
	has_secure_password

	validates :email, :uniqueness => true

	def is_admin
		self.role.downcase == "admin"
	end
end
