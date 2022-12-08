# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :programs, only: :index
      post 'auth', to: 'auth#sign_up'
      resource :sessions, only: %i[create destroy]

      namespace :account do
        resources :users, only: :show do
          get 'programs', on: :collection
        end
        resources :subscriptions, only: %i[create destroy]
        resources :programs, only: :index do
          post 'search', on: :collection
        end
      end
    end
  end
end
