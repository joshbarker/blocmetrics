Rails.application.routes.draw do

  devise_for :users

  get 'welcome/index'

  get 'welcome/about'


  resources :registered_applications

  resources :users, only: [:index, :show]

  # resources :events

  # #1
   namespace :api, defaults: { format: :json } do
  # #2
     resources :events, only: [:create]
   end



  root to: 'welcome#index'

  # authenticated :user do
  #   root :to => "registered_applications#show", as: :logged_in_root
  # end

  # resource :registered_applications do
  #   resources :users, only: [:index, :show]
  #     resources :events
  #   end
  # end
  
  # root to: 'welcome#index'


end
