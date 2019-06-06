Rails.application.routes.draw do

  get 'category_types/index'
  get 'category_types/show'
  get 'category_types/create'
  get 'category_types/edit'
  get 'category_types/update'
  get 'category_types/destroy'
  get 'category_types/new'
  root "static#index"
  devise_for :users
  resources :users, only: [:show]
  resources :category_types
  resources :item_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/a-propos', to: "static#about"
  get '/contact', to: "static#contact"
  get '/mon-profil', to: "users#show"
  post '/contact', to: "static#send_contact_email"

end
