Rails.application.routes.draw do
  # default_url_options format: 'json'

  root 'clients#index'
  resources :clients, except: :show
  resources :services, except: :show
end
