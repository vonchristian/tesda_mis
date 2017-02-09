Rails.application.routes.draw do
  resources :clients
  resources :registries, only: [:index, :show, :new, :create]
  resources :institutions, only: [:index, :show]
  resources :certifications, only: [:index, :show]
  resources :assessors, only: [:index, :show], module: :clients
  resources :trainors, only: [:index, :show], module: :clients
end
