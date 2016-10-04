require 'test_helper'

class NotificationMailerTest < ActionMailer::TestCase

  def setup
    Person.destroy_all
    @recipient ||= FactoryGirl.create(:person)
    @person = FactoryGirl.create(:person)
  end

  def  test_notification_sent_when_new_person_is_created
    email = NotificationMailer.on_create(@person, @recipient)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal(email.subject, 'People App - New person added')
    assert_equal(email.from, ['no-reply@peopleapp.com'])
    assert_equal(email.to, [@recipient.email])
  end

  def  test_notification_sent_when_person_is_deleted
    email = NotificationMailer.on_destroy(@person, @recipient)
    assert_emails 1 do
      email.deliver_now
    end
    assert_equal(email.subject, 'People App - New person deleted')
    assert_equal(email.from, ['no-reply@peopleapp.com'])
    assert_equal(email.to, [@recipient.email])
  end
end
