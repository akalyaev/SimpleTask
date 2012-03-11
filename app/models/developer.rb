class Developer < ActiveRecord::Base
  belongs_to :user
  has_one :user_profile, :through => :user

  scope :free, where(:busy => false)
  scope :busy, where(:busy => true)

  def to_s
    self.user.to_s
  end

  def count_active_stories
    Story.where(:user_id => self.user_id, :active => true).count
  end

  def self.options_for_select
    developers = self
      .includes(:user_profile)
      .order('user_profiles.given_names ASC, user_profiles.surname ASC')
    [["", nil]] + developers.collect { |d| [d.to_s, d.id] }
  end
end
