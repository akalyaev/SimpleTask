require 'spec_helper'

describe "stories/edit.html.haml" do
  before(:each) do
    @story = assign(:story, stub_model(Story,
      :name => "MyString",
      :description => "MyText",
      :status => 1,
      :user_id => 1,
      :points => 1,
      :priority => 1
    ))
  end

  it "renders the edit story form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => stories_path(@story), :method => "post" do
      assert_select "input#story_name", :name => "story[name]"
      assert_select "textarea#story_description", :name => "story[description]"
      assert_select "input#story_status", :name => "story[status]"
      assert_select "input#story_user_id", :name => "story[user_id]"
      assert_select "input#story_points", :name => "story[points]"
      assert_select "input#story_priority", :name => "story[priority]"
    end
  end
end
