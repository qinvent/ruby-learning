Rails.application.routes.draw do

  root "users#index"
  #get "/users", to: "users#index"
  #get "/users/:id", to: "users#show"
  resources :users
  get "users/get_user_details/:id" => "users#get_user_details", as: :get_user_details_user

end
