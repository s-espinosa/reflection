Rails.application.routes.draw do
  get '/', to: 'welcome#show', as: 'welcome'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/instructor-dashboard', to: 'instructor_dashboards#show', as: 'instructor_dashboard'

  resources :users, only: [:show]
  resources :assignments, only: [:new, :create]
  resources :projects, only: [:new, :create] do
    resource :responses, only: [:new, :create, :edit, :update]
  end

  get '/auth/:provider/callback', to: 'sessions#create', as: 'login'
end
