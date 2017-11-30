Rails.application.routes.draw do
  root "questions#index"
  resources :users, only: [:index]
  resources :answers, only: [:index, :show]

  resources :questions do
    resources :answers, only: [:index, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
