Rails.application.routes.draw do
  resources :weathers, only: [:index, :create, :new]
end
