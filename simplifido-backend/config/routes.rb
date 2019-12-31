Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :dogs
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
