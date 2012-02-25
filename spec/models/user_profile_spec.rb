require 'spec_helper'
require 'factory_girl'

describe UserProfile do

  it "returns proper fullname" do
    profile = FactoryGirl.build(:user_profile, :surname => 'Doe', :given_names => 'John')
    profile.full_name(false).should == "John Doe"
    profile.full_name(true).should == "Doe, John"
  end
end
