Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :home, only: %i[index]
    resources :wuhan_coronavirus, only: %i[index create]
  end
end
