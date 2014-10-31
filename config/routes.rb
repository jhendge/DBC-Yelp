Rails.application.routes.draw do


  
  resources :categories, only: [:index] do
  end


  root to: 'reviews#index'

  resources :places do
    resources :photos

    resources :votes
  end

  resources :reviews do
    resources :votes
  end

end
