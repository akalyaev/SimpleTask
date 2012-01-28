class Developer < ActiveRecord::Base
  belongs_to :user

  scope :free, where(:busy => false)
  scope :busy, where(:busy => false)
end
