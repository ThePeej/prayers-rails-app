Rails.application.routes.draw do
  resources :groups
  
  resources :prayers do
    resources :comments
  end

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
