Rails.application.routes.draw do
  root 'campaigns#index'

  # campaigns routes
  resources :campaigns do

    # chapters routes
    resources :chapters, only: [:create, :update, :destroy]

    # characters routes
    resources :characters do

      # blue_books routes
      resources :blue_books

      # items routes
      resources :items
    end

    # setting_details routes
    resources :setting_details, only: [:create, :update, :destroy]
  end

  # notes routes
  resources :notes, only: [:create, :update, :destroy]

  # user session routes
  resources :sessions, only: :create
  get 'login' => 'sessions#new', :as => :login
  delete 'logout' => 'sessions#destroy', :as => :logout

  # user routes
  resources :users, except: :index
end
