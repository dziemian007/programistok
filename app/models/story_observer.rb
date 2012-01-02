class StoryObserver < ActiveRecord::Observer
include Rails.application.routes.url_helpers

  observe :story

  def after_create(story)
    url = story_url(story, :host => "programistok.herokuapp.com")
    Twitter.update("#{story.title} #{url}")
  end

end
