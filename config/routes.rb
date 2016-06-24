Rails.application.routes.draw do
  devise_for :users
  
  resources :users, :customers, :drycleaners do
    resources :invoices do
      resources :items
    end
  end
  devise_scope :user do
    authenticated :user do
      root 'invoices#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
