require 'spec_helper'
require 'factory_girl'

describe Story do

  describe "states:" do
    before(:each) do
      @story = FactoryGirl.create(:story)
      @user = FactoryGirl.create(:user)
    end

    after(:each) do
      @story.destroy
      @user.destroy
    end

    describe "new" do
      it "should be an initial state" do
        @story.new?.should be_true
      end

      it "should change to :accepted on :accept if assigned" do
        @story.user = @user
        @story.accept
        @story.accepted?.should be_true
      end

      it "should raise error if not assigned" do
        @story.user = nil
        lambda {@story.accept!}.should raise_error
      end
    end

    describe "accepted" do
      before(:each) do
        @story.user = @user
        @story.accept
      end

      it "should change to rejected on :reject" do
        @story.reject
        @story.rejected?.should be_true
      end
    end

    describe "rejected" do
      before(:each) do
        @story.user = @user
        @story.accept
        @story.reject
      end

      it "should have nil user" do
        @story.user.should be_nil
      end
    end

    describe "finished" do
      before(:each) do
        @story.user = @user
        @story.accept
        @story.start
        @story.finish
      end

      it "story should have not nil finished_at" do
        @story.finished_at.should_not be_nil
      end
    end
  end
end
