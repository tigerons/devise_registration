Rails.application.routes.draw do

  
  root'rooms#index'
  resources :messages, only:[:create]
  devise_for :users, controllers:  {
        sessions: 'users/sessions'
      }
  resources :rooms, only:[:show, :create]
  mount ActionCable.server => '/cable'
end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
