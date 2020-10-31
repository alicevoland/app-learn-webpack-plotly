Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'static_pages#test'

  get 'static_pages/test'
  get 'static_pages/get_data'
  # scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do

  devise_for :users

  resources :wheel_models, only: %i[index show]

  # end # scope locale
end
