Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :adverts
      resources :adverts_projects_joins
      resources :projects

      root to: "users#index"
    end
  root 'welcome#index'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :adverts, :path => "profiles" do
    resources :avatars, only: [:create]
  end
  resources :dashboard, only:[:show]
  resources :projects do
    resources :adverts_projects_join, only: [:create,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/ourteam', :to=> 'welcome#ourteam'
  resources :contacts, only: [:new, :create]
end

