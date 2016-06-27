Rails.application.routes.draw do
  devise_for :users, :customers, :drycleaners
  
  resources :invoices do
    resources :items
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
