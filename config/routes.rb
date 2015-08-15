Rails.application.routes.draw do

  devise_for :users

  # #1
   namespace :api, defaults: { format: :json } do
  # #2
     match 'create_event', to: 'events#create', via: [:options]
     resources :events, only: [:create]
   end

   match 'create_event', to: 'events#create', via: [:options]
   resources :events, only: [:create]

  get 'welcome/index'

  get 'welcome/about'



  resources :users, only: [:index, :show]

  root to: 'welcome#index'
 
  resources :registered_applications


  # resources :events






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
