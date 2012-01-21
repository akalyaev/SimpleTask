class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user

  STATUSES = {
    0 => 'new',
    1 => 'started',
    2 => 'finished',
    3 => 'accepted',
    4 => 'rejected'
  }

  def self.status_options
    STATUSES.invert
  end

  def self.user_options
    developers = Developer.all
    options = []
    for d in developers do
      user = d.user
      profile = user.user_profile
      options[user.id] = profile ? profile.full_name : user.username
    end
    options
  end

  def status_text
    STATUSES[self.status]
  end
end
