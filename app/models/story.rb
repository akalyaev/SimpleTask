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
    developers = Developer.find(:all, :order => 'up.given_names ASC, up.surname ASC',
                                :joins => "LEFT JOIN user_profiles up ON (up.user_id = developers.user_id)")
    options = []
    for d in developers do
      user = d.user
      profile = user.user_profile
      options << [profile ? profile.full_name : user.username, user.id]
    end
    options
  end

  def status_text
    STATUSES[self.status]
  end
end
