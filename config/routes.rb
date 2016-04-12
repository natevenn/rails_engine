Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:show, :index] do

        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :customers, only: [:show, :index] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoices, only: [:show, :index] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:show, :index] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoice_items, only: [:show, :index] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :transactions, only: [:show, :index] do
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
