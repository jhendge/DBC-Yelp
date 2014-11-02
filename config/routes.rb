Rails.application.routes.draw do

  root to: 'places#index'

  get '/signin', :to => 'sessions#sign_in'
  get '/signout', :to => 'sessions#sign_out'
  get 'auth/:provider/callback', :to => 'sessions#auth'

  post '/places/:place_id/votes', :to => 'votes#make', as: "vote_up"

  resources :categories, only: [:index]

  resources :places do
    resources :reviews do
    resources :votes, except: [:index, :create]
  end
    resources :photos
    resources :votes, except: [:index, :create]
  end



end
