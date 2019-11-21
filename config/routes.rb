Rails.application.routes.draw do
  # get 'sessions/google_oauth'
  get 'sessions/destroy'
  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  
  get 'home/landing'
  get 'home/dashboard'
  
  get 'auth/:provider/callback', to: 'sessions#google_oauth', as: 'google_oauth'
  get 'auth/failure', to: redirect('/')
  
  resources :users do
    collection do
      get 'notifications'
      get 'support'
    end
    
    member do
      get 'billing'
      get 'profile'
      get 'dashboard'
    end
  end
  resources :events
  root 'home#landing'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
