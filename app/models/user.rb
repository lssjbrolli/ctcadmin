class User < ActiveRecord::Base
  before_save :username_downcase
  before_create :create_remember_token, :set_first_user

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

  def set_first_user
    if User.count == 0
      self.admin = true
      self.activated = true
    end
  end
end
