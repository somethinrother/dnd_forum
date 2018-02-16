Rails.application.routes.draw do7
  resources :campaigns
  resources :users, except: :index
end
