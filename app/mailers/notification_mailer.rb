class NotificationMailer < ApplicationMailer
  def on_create(person, recipient)
    @person = person
    @recipient = recipient
    subject = 'People App - New person added'
    mail(to: recipient.email, subject: subject)
  end

  def on_destroy(person, recipient)
    @person = person
    @recipient = recipient
    subject = 'People App - New person deleted'
    mail(to: recipient.email, subject: subject)
  end
end
