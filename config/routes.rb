Rails.application.routes.draw do
  resources :clients
  resources :registries, only: [:index, :show, :new, :create]
  resources :institutions, only: [:index, :show]
  resources :certifications, only: [:index, :show] do 
    resources :issuances, only: [:new, :create], module: :certifications
  end
  resources :issuances, only: [:show], module: :certifications
  resources :national_certificates, only: [:index, :show], module: :certifications
  resources :assessors, only: [:index, :show], module: :clients
  resources :trainors, only: [:index, :show], module: :clients
  resources :training_centers, only: [:index, :show], module: :institutions
  resources :assessment_centers, only: [:index, :show], module: :institutions
end
