class AdminMailer < ActionMailer::Base
  default from: "from@example.com"
  def send_contact(name, email, url, message)
    @name = name
    @email = email
    @url = url
    @message = message
    mail(:to => "vivekonrails@gmail.com", :subject => "Contact Info")
  end
end
