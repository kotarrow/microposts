Rails.application.routes.draw do
  get 'users/new'

  #get 'static_pages/home'
  root to: 'static_pages#home'
end