Rails.application.routes.draw do
  namespace :admin do
    get 'static_pages/home'
  end
  root "static_pages#home"
  get "sessions/new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/upload", to: "products#new"
  post "/upload", to: "products#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
  post "/product_rating/:id", to: "products#rating", as: "rating"
  get "/suggestions", to: "suggestions#new"
  post "/suggestions", to: "suggestions#create"
  get "/recently", to: "recent_views#recently"

  resources :users
  resources :products
  resources :categories

  namespace :admin do
    root "static_pages#home"
    resources :users
    resources :products
  end
end
