module EventRecorder
  extend ActiveSupport::Concern
  included do
    after_create { |resource| resource.call(:create) }
    before_destroy { |resource| resource.call(:destroy) }
  end

  def call(action)
    Person.where.not(id: id).each do |recipient|
      "#{action.to_s.capitalize}PersonWorker".constantize.perform(self, recipient)
    end
  end
end
