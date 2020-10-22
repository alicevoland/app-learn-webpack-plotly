Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'static_pages/test'
  get 'static_pages/get_data'

  root 'static_pages#test'

end
