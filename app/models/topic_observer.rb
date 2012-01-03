class TopicObserver < ActiveRecord::Observer
include Rails.application.routes.url_helpers

  observe :topic

  def after_create(topic)
    url = topic_url(topic, :host => "programistok.herokuapp.com")
    @admins = Admin.all
    @admins.each do |adm|
      TopicsNotificationMailer.send_email(topic, url, adm.email).deliver
    end
  end

end

