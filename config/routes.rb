Rails.application.routes.draw do
  root 'welcome#index'
  devise_for :users
  resources :adverts, only: [:index, :new, :create, :edit, :show, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
