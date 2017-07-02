Rails.application.routes.draw do
  get '/', to: 'welcome#show', as: 'welcome'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/instructor-dashboard', to: 'instructor_dashboards#show', as: 'instructor_dashboard'

  resources :users, only: [:show]

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
