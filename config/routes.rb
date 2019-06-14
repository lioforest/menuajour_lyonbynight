Rails.application.routes.draw do

  root "static#index"

  devise_for :users, path: "", :path_names => { :sign_in => 'se-connecter', :sign_out => 'se-deconnecter', :sign_up => 's-enregistrer' }
  scope(path_names: {new: "nouveau", edit: "modifier"}) do
    resources :users, only: [:show, :update], path: "clients" do
      resources :menus, except: [:new]
      resources :subscriptions, only: [:index, :new, :destroy], path: "abonnement"
      resources :category_types, only: [:create, :update, :edit, :destroy]
      resources :item_types, except:[:new, :show]
    end
  end

  devise_for :admins, path: 'admin', skip: :registrations
  namespace :admin do
    resources :users
    resources :subscriptions
    root :to => "users#index"
  end

  resources :charges, only: [:create]

  #Static pages
  get '/a-propos', to: "static#about"
  get '/contact', to: "static#contact"
  get '/en-cours', to: "static#in_progress"
  get '/notre_offre', to: "static#our_offer"
  post '/contact', to: "static#send_contact_email"
  #get '*path', to: redirect('/*')
  get '/*path', to: "static#error_404"
end
