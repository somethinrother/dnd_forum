Rails.application.routes.draw do
  root 'campaigns#index'
  resources :campaigns do
    resources :chapters, only: [:create, :update, :destroy]
    resources :characters do
      resources :blue_books
      resources :items
    end
    resources :setting_details, only: [:create, :update, :destroy]
  end
  resources :notes, only: [:create, :update, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, except: :index
end
