class User < ActiveRecord::Base
  has_one :user_profile
  has_one :developer
  has_many :stories
  has_many:story_comments
end
