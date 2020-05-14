Rails.application.routes.draw do
  # default_url_options format: 'json'

  root 'clients#index'

  concern :searchable do
    get 'search', action: :search, on: :collection
  end

  resources :clients, except: :show
  resources :services, except: :show, concerns: %i[searchable]
  resources :client_services
  resources :performers, except: :show
end
