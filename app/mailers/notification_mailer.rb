class NotificationMailer < ActionMailer::Base

  def email(from, to, body, subject)
    @mailbody = body
    mail(
      :from => from,
      :to => to,
      :subject => subject)
  end

end