Rails.application.routes.draw do
  devise_for :users, path: '', path_names: {sign_in: 'signin', sign_out: 'logout', registration: 'signup'}, 
              controllers: { sessions: "sessions", registrations: "registrations" }, defaults: { format: :json }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'site#index'
  get 'login', to: 'site#index'
  get 'signup', to: 'site#index'

  resources :users, only: [:index, :show]

  resources :conversations do 
    resources :messages, only: [:index, :create]
  end

  resources :requests
  resources :replies

  get '/conversations/:conversation_id/users', to: 'users#index'
  get '/users/:user_id/conversations(.:format)', to: 'conversations#index'
  get '/requests/:request_id/replies', to: 'replies#index'
  
end
