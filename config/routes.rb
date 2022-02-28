# frozen_string_literal: true

Rails.application.routes.draw do
  resource :qr_code, only: %i[new create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: 'qr_codes#new'
end
