module EventRecorder
  extend ActiveSupport::Concern
  included do
    after_create { |resource| resource.call(:create) }
    before_destroy { |resource| resource.call(:destroy) }
  end

  def call(action)
    resource = self.decorate
    Resque.enqueue("#{action.to_s.capitalize}PersonWorker".constantize, resource.id, resource.full_name)
  end
end
