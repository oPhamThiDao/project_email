Rails.application.routes.draw do
  root "recipients#index"
  resources :recipients, only: %i(index create)
end
