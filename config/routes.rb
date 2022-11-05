# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard, only: %i[index]
  resources :exports, only: %i[index create]
  resources :orders, only: %i[index show]

  root 'orders#index'
end
