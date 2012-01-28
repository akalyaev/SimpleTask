class Developer < ActiveRecord::Base
  belongs_to :user

  scope :free, where(:busy => false)
  scope :busy, where(:busy => false)

  def name
    user = self.user
    profile = user.user_profile
    profile ? profile.full_name : user.username
  end
end
