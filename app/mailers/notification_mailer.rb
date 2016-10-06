class NotificationMailer < ApplicationMailer
  def on_create(person_name, recipient)
    @person_full_name = person_name
    @recipient = recipient.decorate
    subject = 'People App - New person added'
    mail(to: recipient.email, subject: subject)
  end

  def on_destroy(person_name, recipient)
    @person_full_name = person_name
    @recipient = recipient.decorate
    subject = 'People App - New person deleted'
    mail(to: recipient.email, subject: subject)
  end
end
