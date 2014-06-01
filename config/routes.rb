require 'api_constraints'

Rails.application.routes.draw do
  scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
    root 'users#index'
    post 'auth/signup', to: 'auth#signup'
    post 'auth/signin', to: 'auth#signin'

    devise_for :users, controllers: { confirmations: 'v1/confirmations' }
    resources :users, only: [:index, :show]
    resources :surveys, except: [:edit, :destroy]
  end
end
