Rails.application.routes.draw do
  resources :locations

  devise_for :users
  
  resources :malls do
  	collection do 
  		get 'search'
  	end	
    resources :stores, except: [:show, :index]
  end 

  match '/contacts', to: 'contacts#new',      via: 'get'
  resources "contacts", only: [:new, :create] 

  root 'malls#index'

end
