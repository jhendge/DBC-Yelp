Rails.application.routes.draw do

  get '/signin', :to => 'sessions#sign_in'
  get '/signout', :to => 'sessions#sign_out'
  get 'auth/:provider/callback', :to => 'sessions#auth'


  resources :categories, only: [:index] do
  end


  root to: 'pages#index'

  resources :places do
    resources :photos

    resources :votes
  end

  resources :reviews do
    resources :votes
  end

end
