Rails.application.routes.draw do
	resources :sessions, only: [:new, :create, :destroy]
	resources :users, only: [:new, :create, :show]
	resources :events, only: [:new, :create, :show, :index]
  root  to: 'events#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
