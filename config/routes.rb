Rails.application.routes.draw do

  resources :users do
    resources :fees
    resources :expenses
    resources :marks
    resources :corps
    resources :webdocs
    resources :minutes
  end

  resources :attorneys
  resources :todos
  resources :account_activations, only: [:edit]
  resources :users_attorneys

  get 'sessions/new'

  get 'users/new'


  root 'static_pages#home'
  get 'static_pages/home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/news', to: 'static_pages#news'
  get '/lawyers', to: 'static_pages#lawyers'
  get '/mark_tools', to: 'static_pages#mark_tools'
  get '/subscribe', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  get '/logout',  to: 'sessions#destroy'


end
