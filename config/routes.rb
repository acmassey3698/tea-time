Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create, :update]
      get 'customers/:id/subscriptions', to: "customer_subscriptions#index"
    end
  end
end
