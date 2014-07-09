class User < ActiveRecord::Base
	has_secure_password

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :user_name, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, format: {
		with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/
	}

	before_save :downcase_email
	before_save :downcase_user_name

	def downcase_email
		self.email = email.downcase
	end

	def downcase_user_name
		self.user_name = user_name.downcase
	end
end
