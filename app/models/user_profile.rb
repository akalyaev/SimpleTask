class UserProfile < ActiveRecord::Base
  belongs_to :user

  def full_name(reverse=false)
    reverse ?
      "#{self.surname}, #{self.given_names}" :
      "#{self.given_names} #{self.surname}"
  end
end
