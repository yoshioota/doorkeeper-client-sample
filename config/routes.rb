Rails.application.routes.draw do

  resources :articles

  devise_for :users, controllers: {omniauth_callbacks: 'users/omniauth_callbacks'}

  root 'welcome#index'
end
