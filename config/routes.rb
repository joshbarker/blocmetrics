Rails.application.routes.draw do

  devise_for :users

  get 'welcome/index'

  get 'welcome/about'


  resources :registered_applications

  resources :users, only: [:index, :show]



  root to: 'welcome#index'

end
