class StoriesController < ApplicationController

  # GET /stories
  # GET /stories.json
  def index
    @stories = Story.all_active
    @backlog_stories = Story.backlog

    @free_developers = Developer.free
    @busy_developers = Developer.busy

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @story = Story.find(params[:id])

    @story_comments = StoryComment.find_all_by_story_id(@story.id)
    if @current_user
      @story_comment = StoryComment.new({ :story_id => @story.id, :user_id => @current_user.id })
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @story = Story.new(params[:story])

    respond_to do |format|
      if @story.save
        format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to stories_url }
      format.json { head :ok }
    end
  end

  def update_status
    @story = Story.find(params[:id])
    event = params[:event]

    # change state of the story
    @story.send(event)

    respond_to do |format|
      format.html { redirect_to @story }
      format.json { render json: @story }
    end
  end

  def move
    @story = Story.find(params[:id])
    if @story.can_move_to_backlog? || @story.can_move_to_active_sprint?
      @story.move
      @story.save
    end

    respond_to do |format|
      format.html { redirect_to @story, notice: 'Story was successfully moved.' }
    end
  end

  def history
    @stories = Story.finished

    respond_to do |format|
      format.html
      format.json { render json: @stories }
    end
  end
end
