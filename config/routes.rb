Rails.application.routes.draw do
  get '/', to: 'welcome#show', as: 'welcome'
  get '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:show]

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
