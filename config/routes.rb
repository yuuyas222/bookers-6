Rails.application.routes.draw do
  
  get "/search", to: "search#search"
  get 'relationships/index'
  root "homes#index"
  get "home/about" => "homes#about"
  
  
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  

    
    resources :books, only: [:create,:index,:show, :edit, :update, :destroy] do
      resources :book_comments, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end

    resources :users, only: [:show, :edit, :index, :create, :update] do
      resource :relationships, only: [:index, :create, :destroy]
      get :follows, on: :member
      get :followers, on: :member
      # get "/followers" => "relationships#followers"
    end
  
  
  
  
  
  
end
