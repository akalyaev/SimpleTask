class User < ActiveRecord::Base
  has_one :user_profile
  has_one :developer
  has_many :stories
  has_many :story_comments

  validates_presence_of :username
  validates_length_of :username, :maximum => 128

  validates_presence_of :password
  validates_length_of :password, :maximum => 128

  validates_inclusion_of :is_active, :in => [true, false]
  validates_inclusion_of :is_super_admin, :in => [true, false]
end
