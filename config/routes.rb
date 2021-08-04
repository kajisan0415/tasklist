Rails.application.routes.draw do
  get 'seminars/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :tasks
  resources :seminars, only: [:index]
end
