Rails.application.routes.draw do
  resources :groups
  
  resources :prayers do
    resources :comments
  end

  devise_for :users, controllers: { registrations: "users/registrations"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"

  get '/home', to: 'home#landing', as: 'landing'
  patch '/groups/:id/add', to: 'groups#add', as: 'add_member'
  patch '/groups/:id/join', to: 'groups#join', as: 'join_group'
  patch '/groups/:id/leave', to: 'groups#leave', as: 'leave_group'
end
