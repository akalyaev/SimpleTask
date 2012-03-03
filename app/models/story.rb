class Story < ActiveRecord::Base
  has_many :story_comments, :dependent => :destroy
  belongs_to :user

  default_scope where(:deleted_at => nil)
  scope :all_active, where(:active => true)
  scope :backlog, where(:active => false)

  # const declaration
  MAX_POINTS_FOR_SPRINT = 10

  POINT_MIN = 1
  POINT_MAX = 5

  STATUSES = [:new, :started, :finished, :accepted, :rejected]

  PRIORITIES = {
    1 => 'Low',
    2 => 'Normal',
    3 => 'High',
    4 => 'Urgent',
    5 => 'Immediate'
  }

  # validation
  validates :name, :presence => true, :length => {:maximum => 128}
  validates :points,   :numericality => true, :length => {:within => POINT_MIN..POINT_MAX}
  validates :priority, :numericality => true, :length => {:within => 1..5}

  #def initialize
  #  assigned_to = nil
  #  super
  #end

  state_machine :status, :initial => :new do

    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition :new => :accepted, :if => lambda {|story| story.user_id?}
    end

    event :reject do
      transition [:accepted, :started] => :rejected
    end
  end

  def self.user_options
    developers = Developer.includes(:user_profile)
                          .order('user_profiles.given_names ASC, user_profiles.surname ASC')
    [["", nil]] + developers.collect { |d| [d.to_s, d.id] }
  end

  def self.points_options
    POINT_MIN..POINT_MAX
  end

  def self.priority_options
    PRIORITIES.invert
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
    data = {'All' => 0}

    total = 0
    grouped_data = Story.where(:active => true).group(:status).count
    grouped_data.each do |status, count|
      data[status] = count
      total += count
    end
    data['All'] = total

    data
  end
end
