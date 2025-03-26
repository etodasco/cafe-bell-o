Rails.application.routes.draw do
  devise_for :users

  # Routes for MenuItems
  resources :menu_items, only: [:index, :new, :create, :edit, :show, :update, :destroy]

  # Route for Dashboard
  get 'dashboard', to: 'dashboard#home', as: 'dashboard'  # Direct route for dashboard

  # Public pages (home, about, menu, contact)
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'menu', to: 'pages#menu'
  get 'contact', to: 'pages#contact'
end
