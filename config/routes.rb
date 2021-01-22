Rails.application.routes.draw do
  root "prescriptions#index"

  resources :prescriptions
  
  resources :users
  
  # get "signup" => "users#new"

end

