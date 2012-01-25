class StoryComment < ActiveRecord::Base
  belongs_to :story
  belongs_to :user

  validates_presence_of :story_id
  validates_presence_of :user_id
  validates_presence_of :comment
end
