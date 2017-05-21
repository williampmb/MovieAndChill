Rails.application.routes.draw do
  #get 'tickets/index'
  root "user_sessions#login"
  match ':controller(/:action(/:id))', :via => :get



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  delete 'sign_out' => 'user_sessions#destroy'

  

  resources :user_sessions
  resources :movie_sessions
  resources :tickets, only: [:index]

  resources :users do
  	post :buy_ticket, on: :member
  end


end
