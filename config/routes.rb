Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :tasks do
    post :toggle, on: :member
  end
  # post "tasks/:id/toggle", to: "tasks#toggle"
  # Defines the root path route ("/")
  root "tasks#index"
end
