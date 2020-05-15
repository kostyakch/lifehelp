Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  # default_url_options format: 'json'

  root 'clients#index'

  concern :searchable do
    get 'search', action: :search, on: :collection
  end

  resources :clients, except: :show, concerns: %i[searchable]
  resources :services, except: :show, concerns: %i[searchable]
  resources :client_services, concerns: %i[searchable]
  resources :performers, except: :show, concerns: %i[searchable]
end
