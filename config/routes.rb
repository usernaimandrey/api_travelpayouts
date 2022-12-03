# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :programs, only: :index
      post 'auth', to: 'auth#sign_up'
      resource :sessions, only: %i[create destroy]
    end
  end
end
