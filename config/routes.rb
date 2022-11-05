# frozen_string_literal: true

Rails.application.routes.draw do
  resources :dashboard, only: %i[index]
  resources :orders, only: %i[index show]

  root 'orders#index'
end
