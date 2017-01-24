Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trainings, only: [:index, :new, :create]
  resources :trainees, except: [:destroy]
  resources :qualifications, except: [:destroy] do
    resources :competencies, only: [:new, :create], module: :qualifications
  end
end
