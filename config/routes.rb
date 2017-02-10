Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
     get "/", to: 'products#index'
     get "/products", to: 'products#index'
     get "/products/new", to:'products#new'
     get "/products/:id", to: 'products#show'
     post "/products", to: 'products#create'
     get "/products/:id/edit", to: 'products#edit'
     patch "/products/:id", to: 'products#update'
     delete "/products/:id", to: 'products#destroy'
     get "/signup" => "users#new"
     post "/users" => "users#create"
     get "/login" => "sessions#new"
     post "/login" => "sessions#create"
     get "/logout" => "sessions#destroy"
     get "/images", to: 'images#new'
     post "/images", to: 'images#create'
     get "/orders/:id", to: 'orders#show'
     patch "/orders/:id", to: 'orders#update'
     post "/carted_products", to: 'carted_products#create'
     get "/carted_products", to: 'carted_products#index'
     delete "/carted_products/:id", to: 'carted_products#destroy'
end
