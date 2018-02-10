Rails.application.routes.draw do
  get 'dashboard/show'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :diaries
  resources :prescriptions
  root 'dashboard#show'
end
