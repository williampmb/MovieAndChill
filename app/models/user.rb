class User < ApplicationRecord
	has_many :purchase
	has_secure_password
end
