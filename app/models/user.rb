class User < ActiveRecord::Base
  before_save :encrypt_password

  has_one :user_profile, :dependent => :destroy
  has_one :developer, :dependent => :destroy

  has_many :stories
  has_many :story_comments

  validates :username, :presence => true, :length => {:maximum => 128}, :uniqueness => true
  validates :password, :presence => true, :length => {:maximum => 128}, :confirmation => true

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.password = BCrypt::Engine.hash_secret(password, salt)
    end
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && user.password == BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
  end

  def to_s
    profile = self.user_profile
    profile ? profile.full_name : self.username
  end
end
