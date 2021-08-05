Rails.application.routes.draw do

  resources :moves
  resources :pokemon_moves
  resources :users
  resources :sessions
  resources :pokemons

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
