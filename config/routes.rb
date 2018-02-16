Rails.application.routes.draw do

  resources :campaigns do
    resources :chapters, only: [:create, :update, :destroy]
    resources :characters
    resources :setting_details, only: [:create, :update, :destroy]
  end

  resources :notes, only: [:create, :update, :destroy]

  resources :users, except: :index

end
