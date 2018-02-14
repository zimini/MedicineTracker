Rails.application.routes.draw do
  get 'dashboard/show'

  devise_for :users

  resources :diaries
  resources :diary_drugs
  resources :drugs
  resources :prescriptions do
    member do
      post 'add_drug/:drug_id', :action => 'add_drug', :as => 'add_drug'
      delete 'remove_drug/:drug_id', :action => 'remove_drug', :as => 'remove_drug'
    end
  end


  root 'dashboard#show'
end
