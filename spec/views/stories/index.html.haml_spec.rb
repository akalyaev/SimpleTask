require 'spec_helper'

describe "stories/index.html.haml" do
  before(:each) do
    assign(:stories, [
      stub_model(Story,
        :name => "Name",
        :description => "MyText",
        :status => 1,
        :user_id => 2,
        :points => 3,
        :priority => 4
      ),
      stub_model(Story,
        :name => "Name",
        :description => "MyText",
        :status => 1,
        :user_id => 2,
        :points => 3,
        :priority => 4
      )
    ])
  end

  it "renders a list of stories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "h3", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "pre", :text => "MyText".to_s, :count => 2
  end
end
