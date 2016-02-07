Rails.application.routes.draw do
  #get 'sessions/new'
  #get 'users/new'
  #get 'static_pages/home'
  root to: 'static_pages#home'
  get    'signup',  to: 'users#new' #controller内のメソッド、この場合はcontrollers/users_controller.rb
  get    'login' ,  to: 'sessions#new'
  post   'login' ,  to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end