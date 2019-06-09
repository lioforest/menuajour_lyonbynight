Rails.application.routes.draw do

  root "static#index"

  devise_for :users, path: "", :path_names => { :sign_in => 'se-connecter', :sign_out => 'se-deconnecter', :sign_up => 's-enregistrer' }
  scope(path_names: {new: "nouveau", edit: "modifier"}) do
    resources :users, only: [:show], path: "clients" do
      resources :menus
    end
  end
  resources :category_types
  resources :item_types


  #Static pages
  get '/a-propos', to: "static#about"
  get '/contact', to: "static#contact"
  get '/mon-profil', to: "users#show"
  post '/contact', to: "static#send_contact_email"

end
