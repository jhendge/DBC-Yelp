Rails.application.routes.draw do

  root to: 'places#index'

  get '/signin', :to => 'sessions#sign_in'
  get '/signout', :to => 'sessions#sign_out'
  get 'auth/:provider/callback', :to => 'sessions#auth'

  resources :categories, only: [:index]

  resources :places do
    resources :reviews do
    resources :votes
  end
    resources :photos
    resources :votes
  end



end
