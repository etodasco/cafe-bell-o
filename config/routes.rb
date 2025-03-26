Rails.application.routes.draw do
  devise_for :users

  # Admin routes within the 'admin' namespace
  namespace :admin do
    resources :menu_items, only: [:index, :new, :create, :edit, :show, :update, :destroy]
    root to: "dashboard#home"  # This defines the root path for the admin dashboard
  end

  # Public pages (home, about, menu, contact)
  root to: 'pages#home'
  get 'about', to: 'pages#about'
  get 'menu', to: 'pages#menu'
  get 'contact', to: 'pages#contact'
end
