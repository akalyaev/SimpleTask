class UserProfile < ActiveRecord::Base
  belongs_to :user

  def full_name(reverse=false)
    reverse ?
      "#{self.given_names} #{self.surname}" :
      "#{self.surname}, #{self.given_names}"
  end
end
