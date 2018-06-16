# frozen_string_literal: true

Rails.application.routes.draw do
  root 'campaigns#index'

  # campaigns routes
  resources :campaigns do
    # chapters routes
    resources :chapters, only: %i[create update destroy]

    # characters routes
    resources :characters do
      # blue_books routes
      resources :blue_books

      # items routes
      resources :items
    end

    # setting_details routes
    resources :setting_details, only: %i[create update destroy]
  end

  # notes routes
  resources :notes, only: %i[create update destroy]

  # user session routes
  get 'login' => 'sessions#new', :as => :login
  delete 'logout', to: 'sessions#destroy', as: :logout
  resources :sessions, only: [:create]

  # user routes
  resources :users, except: :index
end
