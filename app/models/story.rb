class Story < ActiveRecord::Base
  has_many :story_comments, :dependent => :destroy
  belongs_to :user

  # callbacks
  before_create :define_active

  # scopes
  default_scope where(:deleted_at => nil)
  scope :finished, lambda {
    where("stories.finished_at IS NOT NULL AND stories.finished_at <= ?", Time.zone.now)
  }
  scope :unfinished, where(:finished_at => nil)
  scope :all_active, unfinished.where(:active => true)
  scope :backlog, unfinished.where(:active => false)

  # const declaration
  MAX_POINTS_FOR_SPRINT = 10

  POINT_MIN = 1
  POINT_MAX = 5

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

  state_machine :status, :initial => :new do
    after_transition any => :rejected do |story, transition|
      story.user = nil
      story.save
    end

    before_transition any => :finished do |story, transition|
      story.finished_at = Time.zone.now
    end

    event :start do
      transition :accepted => :started
    end

    event :finish do
      transition :started => :finished
    end

    event :accept do
      transition [:new, :rejected] => :accepted, :if => lambda {|story| story.assigned?}
    end

    event :reject do
      transition [:accepted, :started] => :rejected
    end

    state :new do
      def can_edit?
        true
      end

      def can_assign?
        true
      end
    end

    state :accepted do
      def can_edit?
        true
      end

      def can_assign?
        false
      end
    end

    state :started do
      def can_edit?
        true
      end

      def can_assign?
        false
      end
    end

    state :finished do
      def can_edit?
        false
      end

      def can_assign?
        false
      end
    end

    state :rejected do
      def can_edit?
        true
      end

      def can_assign?
        true
      end
    end
  end

  def self.points_options
    POINT_MIN..POINT_MAX
  end

  def self.priority_options
    PRIORITIES.invert
  end

  def priority_text
    PRIORITIES[priority]
  end

  def description_short
    description.truncate(128)
  end

  def self.total_points(active=true)
    where(:active => active).sum(:points)
  end

  def self.count_stories_grouped_by_status
    data = {'All' => 0}

    total = 0
    grouped_data = Story.all_active.group(:status).count
    grouped_data.each do |status, count|
      data[status] = count
      total += count
    end
    data['All'] = total

    data
  end

  def assigned?
    user_id?
  end

  def can_show_controls?(logged_user)
    assigned? && active && user_id == logged_user.id
  end

  def sprint_full?
    Story.total_points(true) >= MAX_POINTS_FOR_SPRINT
  end

  def can_move_to_backlog?
    active && (new? || rejected?)
  end

  def can_move_to_active_sprint?
    !(active || sprint_full?)
  end

  def move
    self.active = !active
  end

  private

  def define_active
    self.active = false if sprint_full?
  end
end
