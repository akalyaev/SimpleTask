module StoriesHelper

  def link_to_move(story, html_options = {})
    if story.can_move_to_backlog?
      link_to 'Move to backlog', move_story_path(story), html_options
    elsif story.can_move_to_active_sprint?
      link_to 'Move to active sprint', move_story_path(story), html_options
    end
  end
end
