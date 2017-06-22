Rails.application.routes.draw do

  get 'crud_movies/index'

  get 'crud_movies/new'

  get 'crud_movies/create'

  get 'crud_movies/update'

  get 'crud_movies/edit'

  get 'crud_movies/destroy'

  get 'crud_movies/show'

  #get 'tickets/index'
  root "movies#index"
  # match ':controller(/:action(/:id))', :via => :get



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete 'sign_out' => 'user_sessions#destroy'
  get 'users/check_out'
  get 'users/register'
  get 'users/resetArrayChairsId'
  get 'users/pay'
  post 'users/pay'
  post 'users/addSelectedChair'
  post 'users/removeSelectedChair'
  get 'login' => 'user_sessions#login'
  get 'ticket/print' => 'tickets#print'
  get 'tickets/rank'
  
  resources :rooms
  resources :theaters
  resources :movies
  resources :user_sessions
  resources :movie_sessions
  resources :tickets, only: [:index]
  

  resources :users do
  	post :buy_ticket, on: :member
    get :check_out, on: :member
  end
end
