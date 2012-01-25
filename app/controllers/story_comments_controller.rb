class StoryCommentsController < ApplicationController

  # POST /story_comments
  def create
    story = Story.find(params[:story_id])

    # TODO [Anton Kalyaev 25/01/2012] use currently logged user
    @story_comment = StoryComment.new({ :story_id => story.id,
                                        :user_id => User.last.id }.merge(params[:story_comment]))
    respond_to do |format|
      if @story_comment.save
        format.html { redirect_to story, notice: 'Comment was successfully added.' }
      else
        format.html { redirect_to story, notice: 'Comment cannot be added. Check the comment message and resubmit.' }
      end
    end
  end
end
