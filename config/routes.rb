Rails.application.routes.draw do

  root to: 'static_pages#home'
  get    'signup',  to: 'users#new' #controller内のメソッド、この場合はcontrollers/users_controller.rb
  get    'login' ,  to: 'sessions#new'
  post   'login' ,  to: 'sessions#create'
  delete 'logout',  to: 'sessions#destroy'
  #追加
  resources :users do
    member do
      get    'followings' # users/:id/followingsとなる
      get    'followers'
    end
  end

  
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts
  resources :relationships, only: [:create, :destroy]
end