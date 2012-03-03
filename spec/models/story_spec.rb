require 'spec_helper'

describe Story do
  def valid_attributes
    { :name => 'Test task' }
  end

  #it "returns proper status" do
  #  @story = Story.create! valid_attributes
  #  @story.status = 0
  #  @story.status_text.should == 'New'
  #  @story.status = 1
  #  @story.status_text.should == 'Started'
  #  @story.status = 2
  #  @story.status_text.should == 'Finished'
  #  @story.status = 3
  #  @story.status_text.should == 'Accepted'
  #  @story.status = 4
  #  @story.status_text.should == 'Rejected'
  #end
  #
  #it "returns proper priority" do
  #  @story = Story.create! valid_attributes
  #  @story.priority = 1
  #  @story.priority_text.should == 'Low'
  #  @story.priority = 2
  #  @story.priority_text.should == 'Normal'
  #  @story.priority = 3
  #  @story.priority_text.should == 'High'
  #  @story.priority = 4
  #  @story.priority_text.should == 'Urgent'
  #  @story.priority = 5
  #  @story.priority_text.should == 'Immediate'
  #end
end
