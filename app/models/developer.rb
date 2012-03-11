class Developer < ActiveRecord::Base
  belongs_to :user
  has_one :user_profile, :through => :user

  scope :free, where(:busy => false)
  scope :busy, where(:busy => true)

  def to_s
    self.user.to_s
  end

  def count_active_stories
    Story.all_active.where(:user_id => user_id).count
  end

  def self.options_for_select
    developers = self
      .includes(:user_profile)
      .order('user_profiles.given_names ASC, user_profiles.surname ASC')
    [["", nil]] + developers.collect { |d| [d.to_s, d.id] }
  end
end
