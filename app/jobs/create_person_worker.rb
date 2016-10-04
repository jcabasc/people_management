class CreatePersonWorker
  @queue = :people

  def self.perform(person, recipient)
    NotificationMailer.on_create(person, recipient).deliver_now
  end
end
