class User < ActiveRecord::Base
	before_save :username_downcase
	before_create :create_remember_token

	has_many :credit_invoices

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :username, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
	validates :cnp, presence: true, uniqueness: { case_sensitive: false }
	validates :password, length: { minimum: 6 }

	has_secure_password

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end


	private

		def username_downcase
			self.username = username.downcase
		end

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		def proper_name
			self.first_name = first_name.capitalize
			self.last_name = last_name.capitalize
		end

end
