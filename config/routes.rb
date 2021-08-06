Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :moves
      resources :pokemon_moves
      resources :users
      resources :sessions
      resources :pokemons
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
