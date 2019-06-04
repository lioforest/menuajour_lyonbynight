Rails.application.routes.draw do
  root "static#index"
  devise_for :users
  resources :users, only: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/about', :to => "static#about"	  
end
