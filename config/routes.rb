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
  get '/add_gift' => 'gifts#new', as: 'new_gift'
  get '/new_event' => 'events#new', as: 'new_event'
  get '/set_selected_event' => 'events#set_selected_event', as:'set_selected_event'
  get '/join_by_code' => 'events#join_by_code', as: 'join_by_code'
  resources :users do
    collection do
      get 'select_event'
      get 'support'
    end
    
    member do
      get 'my_events'
      get 'notifications'
      get 'billing'
      get 'profile'
      get 'dashboard'
    end
  end
  resources :user_events do
    member do
      get 'user_gifts'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#landing'
end
