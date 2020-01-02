Rails.application.routes.draw do
  resources :comments
  resources :posts
  resources :dogs, only: [:index, :new, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :new, :show, :edit, :update, :destroy]
  post '/login', to: 'auth#create'
  get '/profile', to: 'users#profile'
  post '/signup', to: 'users#create'
  get '/current_user', to: 'auth#show'
  post '/users/:id/dog/new', to: 'dogs#create'
  post '/users/:id/dogs', to: 'users#dogs'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
