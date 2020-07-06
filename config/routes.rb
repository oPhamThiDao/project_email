Rails.application.routes.draw do
  resources :recipients, only: :index  
end
