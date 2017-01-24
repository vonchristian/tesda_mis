Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainings, only: [:index, :new, :create]
  resources :assessments, only: [:index, :show] do
    resources :certificates, only: [:new, :create]
  end
  resources :certificates, only: [:index, :show]

  resources :trainees, except: [:destroy] do
    resources :trainee_trainings, only: [:new, :create, :show], module: :trainees
  end
  resources :trainee_trainings do
    resources :assessments, only: [:new, :create], module: :trainee_trainings
  end
  resources :qualifications, except: [:destroy] do
    resources :competencies, only: [:new, :create], module: :qualifications
  end
end
