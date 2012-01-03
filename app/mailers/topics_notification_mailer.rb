class TopicsNotificationMailer < ActionMailer::Base

  default from: "amberbit_www@amberbit.com", content_type: "text/html"

  def send_email(topic, url, email)
    @topic = topic
    @url  = url
    mail(:content_type => "text/html",  :to => email, :subject => "Nowa propozycja tematu na Programistok")
  end

end
