Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'static_pages#test'

  scope '(:locale)', locale: /#{I18n.available_locales.join("|")}/ do
    get 'static_pages/test'
    get 'static_pages/get_data'
  end
end
