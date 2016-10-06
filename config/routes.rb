Rails.application.routes.draw do
  root to: 'people#index'
  resources :people
  mount Resque::Server.new, at: "/resque"
end
