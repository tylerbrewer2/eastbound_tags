Rails.application.routes.draw do
  resources :rounds do
    member do
      patch 'complete'
      patch 'open'
    end
  end
  resources :players, only: [:new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'rounds#index'
end
