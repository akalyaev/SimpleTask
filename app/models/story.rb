class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user

  # const declaration
  POINT_MIN = 1
  POINT_MAX = 5

  STATUSES = {
    0 => 'new',
    1 => 'started',
    2 => 'finished',
    3 => 'accepted',
    4 => 'rejected'
  }

  # validation
  validates_presence_of :name
  validates_length_of :name, :maximum => 128

  validates_numericality_of :status,
                            :only_integer => true,
                            :less_than_or_equal_to => 4, :greater_than_or_equal_to => 0

  validates_numericality_of :points,
                            :only_integer => true,
                            :less_than_or_equal_to => POINT_MAX, :greater_than_or_equal_to => POINT_MIN

  validates_numericality_of :priority,
                            :only_integer => true,
                            :less_than_or_equal_to => 5, :greater_than_or_equal_to => 1

  # get options section
  def self.status_options
    STATUSES.invert
  end

  def self.user_options
    developers = Developer.find(:all,
                                :order => "up.given_names ASC, up.surname ASC",
                                :joins => "LEFT JOIN user_profiles up ON (up.user_id = developers.user_id)")
    options = []
    for d in developers do
      user = d.user
      profile = user.user_profile
      options << [profile ? profile.full_name : user.username, user.id]
    end
    options
  end

  def self.points_options
    POINT_MIN..POINT_MAX
  end

  def status_text
    STATUSES[self.status]
  end
end
