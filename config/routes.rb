Rails.application.routes.draw do
  get 'tickets/index'
  root "user_sessions#login"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  delete 'sign_out' => 'user_sessions#destroy'
  resources :user_sessions
end
