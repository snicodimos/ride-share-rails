Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'rideshare#index'

  resources :rideshare, only:[:index]

  resources :drivers do
    member do
      patch :update_status
    end
  end

  resources :trips, only: [:show, :update]

  resources :passengers do
    resources :trips, only: [:create, :show]
  end
end
