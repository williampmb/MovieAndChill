class User < ApplicationRecord
	has_many :tickets
	has_secure_password
end
