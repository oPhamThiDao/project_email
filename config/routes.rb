Rails.application.routes.draw do
  resources :recipients, only: %i(index create)
end
