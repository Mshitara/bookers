class User < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { in: 2..20 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, format: {with: VALID_EMAIL_REGEX}
	validates :password, presence: true, length: {minimum: 6}, allow_nil: true
	validates :introduction, length: {maximum: 50}
	has_secure_password
	attachment :profile_image
	has_many :books, dependent: :destroy
end
