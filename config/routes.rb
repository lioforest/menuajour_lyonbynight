Rails.application.routes.draw do
  root "static#index"
  devise_for :users, path: "", :path_names => { :sign_in => 'se-connecter', :sign_out => 'se-deconnecter', :sign_up => 's-enregistrer' }
  scope(path_names: {new: "nouveau", edit: "modifier"}) do
    resources :users, only: [:show], path: "clients" do
      resources :menus
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/a-propos', to: "static#about"
  get '/contact', to: "static#contact"
  get '/votre-profil', to: "users#show"
  post '/contact', to: "static#send_contact_email" 
end
