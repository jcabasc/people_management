class CreatePersonWorker
  @queue = :people

  def self.perform(id, person_name)
    Person.where.not(id: id).each do |recipient|
      NotificationMailer.on_create(person_name, recipient).deliver_now
    end
  end
end
