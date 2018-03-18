Rails.application.routes.draw do
  root 'home#index'
  get 'index', to: 'home#index'
  get 'contact', to: 'home#contact'
  get 'portfolio', to: 'home#portfolio'
  get 'about', to: 'home#about'

  devise_for :users, controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  resources :doors
  post 'doors/new', to: 'doors#create'
  put 'doors/:id/edit', to: 'doors#update'
  post 'doors/:id', to: 'orders#create', as: 'order_path'
  get 'orders', to: 'orders#index'
  delete 'orders/:id', to: 'orders#destroy', as: 'order_delete'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
