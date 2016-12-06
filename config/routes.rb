Rails.application.routes.draw do
  
  resources :users
  resources :marks
  resources :corps
  
  get 'sessions/new'

  get 'users/new'
  

  root 'static_pages#home'
  get 'static_pages/home'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/terms', to: 'static_pages#terms'
  get '/news', to: 'static_pages#news'
  get '/subscribe', to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  
end
