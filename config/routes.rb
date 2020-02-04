Rails.application.routes.draw do
  # get 'sessions/google_oauth'
  get "sessions/destroy"
  get "login", to: redirect("/auth/google_oauth2"), as: "login"
  get "logout", to: "sessions#destroy", as: "logout"
  get "auth/:provider/callback", to: "sessions#create"
  get "auth/failure", to: redirect("/")

  get "home/landing"
  get "home/dashboard"

  get "auth/:provider/callback", to: "sessions#google_oauth", as: "google_oauth"
  get "/add_gift" => "gifts#new", :as => "new_gift"
  get "/new_event" => "events#new", :as => "new_event"
  get "/set_selected_event" => "events#set_selected_event", :as => "set_selected_event"
  post "/join_by_code" => "user_events#create", :as => "join_by_code"

  resources :users do
    collection do
      get "select_event"
      get "support"
    end

    member do
      get 'wishes'
      get "my_events"
      get "notifications"
      get "billing"
      get "profile"
      get "dashboard"
    end
  end

  resources :gifts do
    collection do
    end
  end


  get "events/:id/users" => "events#users", :as => "event_users"
  get "user_events/:id/giftee" => "user_events#giftee", :as => "giftee"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "home#landing"
end
