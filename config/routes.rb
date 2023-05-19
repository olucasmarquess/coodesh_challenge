Rails.application.routes.draw do
  root 'home#index'

  get '/products', to: 'products#index'
  get '/products/:code', to: 'products#show'
  get '/sync', to: 'products#sync'
end
