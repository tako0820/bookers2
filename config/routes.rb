Rails.application.routes.draw do

  root to: "homes#top"
  get 'homes/about' ,as: 'about'

  devise_for :users

  resources :users, only:[:show, :edit, :index]
  resources :books

end
