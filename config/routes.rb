Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do

      resources :merchants, only: [:show, :index] do

        resources :items, only: [:index], module: "merchants"
        resources :invoices, only: [:index], module: "merchants"

        collection do
          get 'find', to: 'merchants/search#show'
          get 'find_all', to: 'merchants/search#index'
          get 'random', to: 'merchants/search#random'
          get 'most_revenue', to: 'merchants/most_revenue#index'
          get 'most_items', to: 'merchants/most_items#index'
          get 'revenue', to: 'merchants/revenue#show'
        end
      end

      resources :customers, only: [:show, :index] do
        resources :invoices, only: [:index], module: "customers"
        resources :transactions, only: [:index], module: "customers"
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoices, only: [:show, :index] do

        resources :transactions, only: [:index], module: "invoices"
        resources :invoice_items, only: [:index], module: "invoices"
        resources :items, only: [:index], module: "invoices"
        resources :customer, only: [:index], module: "invoices"
        resources :merchant, only: [:index], module: "invoices"

        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :items, only: [:show, :index] do

        resources :invoice_items, only: [:index], module: "items"
        resources :merchant, only: [:index], module: "items"
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :invoice_items, only: [:show, :index] do

        resources :invoice, only: [:index], module: "invoice_items"
        resources :item, only: [:index], module: "invoice_items"
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end

      resources :transactions, only: [:show, :index] do

        resources :invoice, only: [:index], module: "transactions"
        collection do
          get 'find'
          get 'find_all'
          get 'random'
        end
      end
    end
  end
end
