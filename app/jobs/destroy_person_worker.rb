class DestroyPersonWorker
  @queue = :people

  def self.perform(person, recipient)
    NotificationMailer.on_destroy(person, recipient).deliver_now
  end
end
