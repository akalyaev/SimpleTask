class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user

  default_scope where(:deleted_at => nil)
  scope :all_active, where(:active => true)
  scope :backlog, where(:active => false)

  # const declaration
  MAX_POINTS_FOR_SPRINT = 10

  POINT_MIN = 1
  POINT_MAX = 5

  STATUSES = {
    0 => 'New',
    1 => 'Started',
    2 => 'Finished',
    3 => 'Accepted',
    4 => 'Rejected'
  }

  PRIORITIES = {
    1 => 'Low',
    2 => 'Normal',
    3 => 'High',
    4 => 'Urgent',
    5 => 'Immediate'
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
    options = [["", nil]]
    for developer in developers do
      options << [developer.to_s, developer.id]
    end
    options
  end

  def self.points_options
    POINT_MIN..POINT_MAX
  end

  def self.priority_options
    PRIORITIES.invert
  end

  def status_text
    STATUSES[self.status]
  end

  def priority_text
    PRIORITIES[self.priority]
  end

  def description_short
    description.truncate(128)
  end

  def self.total_points(active=true)
    where(:active => active).sum(:points)
  end

  def create
    self.active = false if (Story.total_points(true) >= MAX_POINTS_FOR_SPRINT)
    super
  end

  def self.count_stories_grouped_by_status
    data = {"All" => 0}
    total = 0
    STATUSES.each do |key, status|
      count = Story.where(:status => key, :active => true).count
      data[status] = count
      total += count
    end
    data["All"] = total
    data
  end
end
