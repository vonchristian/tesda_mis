Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainings, only: [:index, :new, :create]

  resources :trainees, except: [:destroy] do
    resources :trainee_trainings, only: [:new, :create], module: :trainees
  end
  resources :qualifications, except: [:destroy] do
    resources :competencies, only: [:new, :create], module: :qualifications
  end
end
