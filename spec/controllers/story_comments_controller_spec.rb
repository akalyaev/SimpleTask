require 'spec_helper'

describe StoryCommentsController do
  before do
    @story = Story.create({ :name => 'test' })
    @user = User.create({ :username => 'test', :salt => '', :password => 'test' })
    # FIXME [Anton Kalyaev 05/03/2012] this looks ugly
    # log in user
    session[:user_id] = @user.id
    @valid_attributes = { :comment => 'Test comment' }
  end

  describe "GET create" do
    describe "with valid params" do
      it "creates a new comment" do
        expect {
          post :create, :story_id => @story.id, :story_comment => @valid_attributes
        }.to change(StoryComment, :count).by(1)
      end

      it "assigns a newly created comment as @story_comment" do
        post :create, :story_id => @story.id, :story_comment => @valid_attributes
        assigns(:story_comment).should be_a(StoryComment)
        assigns(:story_comment).should be_persisted
      end

      it "redirects to the story" do
        post :create, :story_id => @story.id, :story_comment => @valid_attributes
        response.should redirect_to(@story)
      end
    end
  end

end
