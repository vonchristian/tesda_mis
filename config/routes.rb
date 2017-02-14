Rails.application.routes.draw do
  get 'result/index' => "result#index"
  resources :clients
  resources :worker_registries, only: [:index, :show, :new, :create], module: :registries
  resources :assessor_registries, only: [:index, :show, :new, :create], module: :registries
  resources :institutions, only: [:index, :show, :new, :create]
  resources :certifications, only: [:index, :show] do 
    match "/expired" => "certifications/expired_certifications#index",  via: [:get], on: :collection

    resources :issuances, only: [:new, :create], module: :certifications
  end
  resources :national_certificates, only: [:index, :show], controller: "certifications", type: "Certifications::NationalCertificate"
  resources :certificate_of_competencies, only: [:index, :show], controller: "certifications", type: "Certifications::CertificateOfCompetency"

  resources :issuances, only: [:show], module: :certifications
  resources :assessors, only: [:index, :show], module: :clients do 
    resources :addresses, only: [:new, :create], type: "Clients::Assessor", controller: "addresses"
    resources :accreditations, only: [:new, :create], type: "Clients::Assessor", controller: "accreditations", module: :assessors
    resources :educations, only: [:new, :create], type: "Clients::Assessor", controller: "educations"
    resources :employments, only: [:new, :create]
  end
  resources :trainors, only: [:index, :show], module: :clients
  resources :workers, only: [:index, :show, :new, :create], module: :clients
  resources :training_centers, only: [:index, :show], module: :institutions
  resources :assessment_centers, only: [:index, :show], module: :institutions
  resources :assessments, only: [:show], module: :services
  namespace :reports do 
    resources :certifications, only: [:index]
  end
  resources :addresses, only: [:new, :create]
  resources :qualifications, only: [:index, :new, :show]
  namespace :settings do 
    resources :signatories, except:[:destroy]
  end
end
