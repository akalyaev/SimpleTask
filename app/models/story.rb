class Story < ActiveRecord::Base
  has_many :story_comments
  belongs_to :user
end
