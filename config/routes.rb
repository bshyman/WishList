Rails.application.routes.draw do
  
  get '/user/notifications' => 'users#notifications'
  get '/user/support' => 'users#support'
  get '/user/profile' => 'users#profile'
  get '/user/plan' => 'users#plan'
  get '/user/billing' => 'users#billing'
  get '/user' => 'users#profile'
  get '/user/notifications' => 'user#notifications'
  get '/user/support' => 'user#support'
  get '/user/profile' => 'user#profile'
  get '/user/plan' => 'user#plan'
  get '/user/billing' => 'user#billing'
  get '/user' => 'user#profile'
  get '/user/notifications' => 'account#notifications'
  get '/user/support' => 'account#support'
  get '/user/profile' => 'account#profile'
  get '/user/plan' => 'account#plan'
  get '/user/billing' => 'account#billing'
  get '/user' => 'account#profile'
  resources :users
  root 'users#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
