Rails.application.routes.draw do
  root 'home#index'

  resources :products, only: [:index, :show]
  get '/sync', to: 'products#sync'
end
