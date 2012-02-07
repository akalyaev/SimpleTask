class User < ActiveRecord::Base
  has_one :user_profile, :dependent => :destroy
  has_one :developer, :dependent => :destroy
  has_many :stories
  has_many :story_comments

  validates :username, :presence => true, :length => {:maximum => 128}
  validates :password, :presence => true, :length => {:maximum => 128}

  def create
    # TODO [Anton Kalyaev 21/01/2012] generate a salt here and hash a password
    self.salt = "XXX"
    super
  end

  def to_s
    profile = self.user_profile
    profile ? profile.full_name : self.username
  end
end
