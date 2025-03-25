Rails.application.routes.draw do
  # Devise routes for user authentication
  devise_for :users

  # Admin routes within the 'admin' namespace
  namespace :admin do
    resources :menu_items # Admin management of menu items
    resources :users      # Admin management of users (if needed)
    root to: "dashboard#home" # Admin dashboard root
  end

  # Main pages (e.g., home, about, contact)
  root "pages#home" # This is the root route for the public site
  get 'about', to: 'pages#about'
  get 'menu', to: 'pages#menu'
  get 'contact', to: 'pages#contact'
end
