class StoriesController < ApplicationController

  after_filter :static_content

  def index
    collect_stories
  end

  def show
    collect_stories
    if params[:id] == 'v2'
      render :stories_2
    else
      redirect_to :index
    end
  end

  private
  def collect_stories
    all_stories = EmergencyStory.order("index,id ASC").all
    @selected_story = all_stories.select {|s| s.selected}.first
    @stories = all_stories.collect.select {|s| !s.selected}
  end    
end
