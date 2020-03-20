Rails.application.routes.draw do
  get 'dashboard/show'
  root 'welcome#index'
  devise_for :users
  resources :adverts, only: [:index, :new, :create, :edit, :show, :destroy]
  resources :projects do
    resources :adverts_projects_join, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
