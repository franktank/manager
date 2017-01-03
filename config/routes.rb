Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "mydevise/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "splash#splash"

  # Api
  namespace :api do
    resources :groups, only: [:create, :edit, :update]
  end

  resources :groups, only: [:create, :edit, :update]
  resources :invites, only: [:new, :create]
end
