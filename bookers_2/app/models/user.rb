class User < ApplicationRecord
	validate :name, presence: true, length: { in: 2..20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validate :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}
end
