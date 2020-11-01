Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#home'

  devise_for :users

  resources :wheel_models, only: %i[index show]
  resources :users, only: %i[show] do
    resources :wheel_values
    resources :coachings
  end
end
