Rails.application.routes.draw do
  resources :clients
  resources :registries, only: [:index, :show, :new, :create]
  resources :institutions, only: [:index, :show, :new, :create]
  resources :certifications, only: [:index, :show] do 
    resources :issuances, only: [:new, :create], module: :certifications
  end
  resources :national_certificates, only: [:index, :show], controller: "certifications", type: "Certifications::NationalCertificate"
  resources :certificate_of_competencies, only: [:index, :show], controller: "certifications", type: "Certifications::CertificateOfCompetency"

  resources :issuances, only: [:show], module: :certifications
  resources :assessors, only: [:index, :show], module: :clients
  resources :trainors, only: [:index, :show], module: :clients
  resources :training_centers, only: [:index, :show], module: :institutions
  resources :assessment_centers, only: [:index, :show], module: :institutions
  resources :assessments, only: [:show], module: :services
end
