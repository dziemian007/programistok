class UserMailer < ActionMailer::Base

  default from: "amberbit_www@amberbit.com", content_type: "text/html"

  def send_email(topic)
    @topic = topic
    @url  = topic_url(@topic)
    mail(:content_type => "text/html",  :to => "kamil.dziemianowicz@gmail.com", :subject => "Nowa propozycja tematu na Programistok")
  end

end
