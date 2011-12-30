class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :find_events_for_sidebar

  private

  def find_events_for_sidebar
    @events = Meeting.paginate(:page=>params[:event_page], :per_page=>1, :order=>"datetime desc")


    #@events = Meeting.paginate :page=>params[:event_page], :per_page=>1, :order=>"datetime"
    #:conditions=>"datetime >= '#{Date.today}'"


    @event_topics = Topic.where(:meeting_id => @events[0].id)
  end

end
