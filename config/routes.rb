Rails.application.routes.draw do
  resources :genres
  resources :tracks do
  	member do
  		get :download
  	end
  end
  resources :artists do
    resources :tracks, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
