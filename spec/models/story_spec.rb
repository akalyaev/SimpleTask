require 'spec_helper'
require 'factory_girl'

describe Story do

  describe "states" do
    before(:all) do
      @user = FactoryGirl.create(:user)
    end

    after(:all) do
      @user.destroy
    end

    describe "new" do
      before(:all) do
        @story = FactoryGirl.create(:new_story)
      end

      after(:all) do
        @story.destroy
      end

      it "should be an initial state" do
        @story.new?.should be_true
      end

      it "should change to :accepted on :accept if assigned" do
        @story.user = @user
        @story.accept!
        @story.accepted?.should be_true
      end

      it "should raise error if not assigned" do
        @story.user = nil
        lambda {@story.accept!}.should raise_error
      end
    end
  end
end
