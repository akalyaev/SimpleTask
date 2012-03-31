require 'spec_helper'

describe CalendarController do
  before(:each) do
    controller.stub!(:logged_in?).and_return(true)
  end

  describe "GET index" do
    it "assigns active stories as @stories" do
      get :index
      assert_response :success
    end
  end
end
