Rails.application.routes.draw do
  resources :categories do
    resources :products, only: [:create, :delete]
  end
  resources :products do
    resources :products, only: [:create, :delete]
  end
  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
