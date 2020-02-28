Rails.application.routes.draw do
  # resources :london_users
  # resources :users
  # resources :cities
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/cities", to:"cities#index", as:"cities"
  
  get "/users", to:"users#index", as:"users"
  get "/cities/london/users", to:"users#london_users_index", as:"users_in_london"
  get "/cities/within_50_mi_of_london/users", to:"users#london_50_mi_of_london_users_index", as:"users_within_50_london"

end
