Rails.application.routes.draw do
  # get 'cities/index'

  # get 'cities/show'
  resources :cities, only: [:index, :show]

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'webhooks', to: 'webhooks#messenger'
  post 'webhooks', to: 'webhooks#receive_message'
end
