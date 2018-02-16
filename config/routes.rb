Rails.application.routes.draw do

  resources :campaigns do
    resources :chapters, only: [:create, :update, :destroy]
    resources :setting_details, only: [:create, :update, :destroy]
  end


  resources :users, except: :index

end
