class Developer < ActiveRecord::Base
  belongs_to :user

  scope :free, where(:busy => false)
  scope :busy, where(:busy => true)

  def to_s
    self.user.to_s
  end

  def count_active_stories
    Story.where(:user_id => self.user_id, :active => true).count
  end
end
