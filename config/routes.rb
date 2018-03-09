Rails.application.routes.draw do
  resources :groups do
    patch 'add_member', on: :member
    patch 'join', on: :member
    patch 'leave', on: :member
    resources :members, only: [:create]
  end

  # patch '/groups/:id/add', to: 'groups#add', as: 'add_member'
  
  resources :prayers do
    resources :comments
  end

  devise_for :users, controllers: { registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "home#index"
  get '/home', to: 'home#landing', as: 'landing'
  
end
