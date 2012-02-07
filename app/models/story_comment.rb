class StoryComment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates :story_id, :presence => true
  validates :user_id, :presence => true
  validates :comment, :presence => true
end
